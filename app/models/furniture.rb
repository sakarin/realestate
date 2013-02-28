# == Schema Information
#
# Table name: furnitures
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Furniture < ActiveRecord::Base
  attr_accessible :name

  has_many :furnitures_listings
  has_many :listings, through: :furnitures_listings

  validates_presence_of :name
end
