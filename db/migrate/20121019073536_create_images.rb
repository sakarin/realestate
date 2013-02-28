class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :attachment
      t.integer :position
      t.integer :listing_id
      t.string :session_id

      t.timestamps
    end
  end
end
