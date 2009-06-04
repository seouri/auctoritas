class Article < ActiveRecord::Base
  belongs_to :journal, :counter_cache => true
  has_many :authorships
  has_many :authors, :through => :authorships

  accepts_nested_attributes_for :journal
  accepts_nested_attributes_for :authorships, :allow_destroy => true
  
  def self.search(query, options = {})
    options[:per_page] ||= 10
    options[:page] ||= 1
    paginate options
  end
  
  def self.total_entries
    Rails.cache.fetch("total_articles_cached") { count('id') }
  end

  def update_from_pubmed(pmid)
    efetch = Bio::PubMed.efetch(pmid)
    medline = Bio::MEDLINE.new(efetch)
    self.source = "PubMed"
    self.source_id = medline.pmid
    self.year = medline.year
    self.volume = medline.volume
    self.issue = medline.issue
    self.pages = medline.pages
    self.title = medline.title
    self.doi = medline.doi
    journal_name = medline.pubmed['JT'].gsub(/\s+/, ' ').strip
    journal_abbreviation = medline.pubmed['TA'].gsub(/\s+/, ' ').strip
    self.journal = Journal.find_or_initialize_by_name_and_abbreviation(journal_name, journal_abbreviation)
    if medline.authors.size
      authors = medline.pubmed["FAU"].split(/\n/).map {|n| n.split(/\s*,\s*/) }
      authors = medline.pubmed["AU"].split(/\n/).map {|n| n.split(/\s+/) } if authors.size == 0    
      authors.each_index do |i|
        affiliation = i == 0 ? medline.pubmed['AD'].gsub(/\s+/, ' ').strip : ""
        self.authorships.build(:lastname => authors[i][0], :forename => authors[i][1], :position => i + 1, :affiliation => affiliation)
      end
    end
  end
end
