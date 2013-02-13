# == Schema Information
#
# Table name: furnitures_listings
#
#  id           :integer          not null, primary key
#  furniture_id :integer
#  listing_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FurnituresListing < ActiveRecord::Base
  belongs_to :furniture
  belongs_to :listing
end
