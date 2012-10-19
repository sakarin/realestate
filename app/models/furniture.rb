class Furniture < ActiveRecord::Base
  attr_accessible :name

  has_many :furnitures_listings
  has_many :listings, through: :furnitures_listings

  validates_presence_of :name
end
