class CreateUnitFeaturesListings < ActiveRecord::Migration
  def change
    create_table :unit_features_listings do |t|
      t.integer :unit_feature_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
