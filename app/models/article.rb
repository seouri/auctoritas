class Article < ActiveRecord::Base
  def self.search(query, options = {})
    options[:per_page] ||= 20
    options[:page] ||= 1
    paginate options
  end
end
