# == Schema Information
#
# Table name: free_spaces_listings
#
#  id            :integer          not null, primary key
#  free_space_id :integer
#  listing_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class FreeSpacesListing < ActiveRecord::Base
  belongs_to :free_space
  belongs_to :listing
end
