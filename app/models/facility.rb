# == Schema Information
#
# Table name: facilities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Facility < ActiveRecord::Base
  attr_accessible :name

  has_many :facilities_listings
  has_many :listings, through: :facilities_listings

  validates_presence_of :name
end
