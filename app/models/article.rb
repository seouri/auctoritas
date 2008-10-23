class Article < ActiveRecord::Base
  has_many :authorships, :include => :author
  has_many :authors, :through => :authorships
  
  def self.search(query, options = {})
    options[:per_page] ||= 10
    options[:page] ||= 1
    paginate options
  end
  
  def self.total_entries
    Rails.cache.fetch("total_articles_cached") { count('id') }
  end
end
