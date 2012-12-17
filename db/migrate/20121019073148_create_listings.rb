class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :listing_type
      t.string :property_type
      t.string :listing_title_th
      t.string :listing_description_th

      # Location
      t.references :amphur
      t.references :district
      t.references :province

      t.string :property_name
      t.string :street_number
      t.string :street_name
      t.string :post_code

      # Price
      t.integer :price
      t.string :price_type
      t.string :tenure

      # Map
      t.string :lat_value
      t.string :lon_value

      # Amphur
      t.integer :floorarea
      t.integer :floorsize_x
      t.integer :floorsize_y
      t.integer :landarea_rai
      t.integer :landarea_ngaan
      t.integer :landarea_sqw
      t.integer :landsize_x
      t.integer :landsize_y

      t.string  :bedrooms
      t.string  :extra_rooms
      t.string  :bathrooms
      t.string  :number_of_floors
      t.string  :floor_position
      t.string  :furnishing
      t.string  :facing


      t.integer :user_id
      t.string  :status
      t.datetime :published_date
      t.datetime :expired_date
      t.string  :notepad
      t.string :comment


      t.timestamps
    end
  end
end
