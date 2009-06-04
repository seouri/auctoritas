class Authorship < ActiveRecord::Base
  belongs_to :article, :counter_cache => true
  belongs_to :author
  
  def fullname
    "#{forename} #{lastname}"
  end
end
