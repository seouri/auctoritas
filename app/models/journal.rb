class Journal < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
  
  validates_presence_of :name, :abbreviation
  validates_uniqueness_of :name
  validates_uniqueness_of :abbreviation
end
