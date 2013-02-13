# == Schema Information
#
# Table name: unit_features_listings
#
#  id              :integer          not null, primary key
#  unit_feature_id :integer
#  listing_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UnitFeaturesListing < ActiveRecord::Base
  belongs_to :unit_feature
  belongs_to :listing
end
