# == Schema Information
#
# Table name: facilities_listings
#
#  id          :integer          not null, primary key
#  facility_id :integer
#  listing_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FacilitiesListing < ActiveRecord::Base
  belongs_to :facility
  belongs_to :listing
end
