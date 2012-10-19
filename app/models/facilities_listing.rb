class FacilitiesListing < ActiveRecord::Base
  belongs_to :facility
  belongs_to :listing
end
