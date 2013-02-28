# == Schema Information
#
# Table name: unit_features
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UnitFeature < ActiveRecord::Base
  attr_accessible :name

  has_many :unit_features_listings
  has_many :listings, through: :unit_features_listings

  validates_presence_of :name
end
