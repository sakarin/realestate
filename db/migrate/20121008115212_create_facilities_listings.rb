class CreateFacilitiesListings < ActiveRecord::Migration
  def change
    create_table :facilities_listings do |t|
      t.integer :facility_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
