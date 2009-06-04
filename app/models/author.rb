class Author < ActiveRecord::Base
  has_many :authorships, :include => :article
  has_many :articles, :through => :authorships
  has_many :coauthorships, :include => :coauthor
  has_many :coauthors, :through => :coauthorships
  
  def self.search(query, options = {})
    options[:per_page] ||= 10
    options[:page] ||= 1
    paginate options
  end

  def self.total_entries
    Rails.cache.fetch("total_authors_cached") { count('id') }
  end
    
  def full_name
    "#{lastname}, #{forename}"
  end
end
