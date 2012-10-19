class FreeSpace < ActiveRecord::Base
  attr_accessible :name

  has_many :free_spaces_listings
  has_many :listings, through: :free_spaces_listings

  validates_presence_of :name
end
