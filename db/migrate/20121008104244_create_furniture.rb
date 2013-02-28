class CreateFurniture < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.string :name

      t.timestamps
    end
  end
end
