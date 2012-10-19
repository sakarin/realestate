class Facility < ActiveRecord::Base
  attr_accessible :name

  has_many :facilities_listings
  has_many :listings, through: :facilities_listings

  validates_presence_of :name
end
