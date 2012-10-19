class FurnituresListing < ActiveRecord::Base
  belongs_to :furniture
  belongs_to :listing
end
