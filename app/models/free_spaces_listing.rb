class FreeSpacesListing < ActiveRecord::Base
  belongs_to :free_space
  belongs_to :listing
end
