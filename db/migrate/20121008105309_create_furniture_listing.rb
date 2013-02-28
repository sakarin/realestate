class CreateFurnitureListing < ActiveRecord::Migration
  def change
    create_table :furnitures_listings do |t|
      t.references :furniture
      t.references :listing

      t.timestamps
    end
  end
end
