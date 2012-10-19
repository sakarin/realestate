class FreeSpacesListings < ActiveRecord::Migration
  def change
    create_table :free_spaces_listings do |t|
      t.references :free_space
      t.references :listing

      t.timestamps
    end
  end
end
