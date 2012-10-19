class UnitFeature < ActiveRecord::Base
  attr_accessible :name

  has_many :unit_features_listings
  has_many :listings, through: :unit_features_listings

  validates_presence_of :name
end
