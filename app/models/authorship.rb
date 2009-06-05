class Authorship < ActiveRecord::Base
  belongs_to :article, :counter_cache => true
  belongs_to :author
  
  validates_associated :article
  validates_presence_of :position
  validates_uniqueness_of :position, :scope => :article_id
  
  def fullname
    "#{forename} #{lastname}"
  end
end
