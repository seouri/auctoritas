class Article < ActiveRecord::Base
  has_many :authorships, :include => :author
  
  def self.search(query, options = {})
    options[:per_page] ||= 10
    options[:page] ||= 1
    paginate options
  end
end
