class CreatePostGroups < ActiveRecord::Migration
  def change
    create_table :post_groups do |t|
      t.string :name
      t.string :slug
      t.integer :parent
      t.text :description

      t.timestamps
    end
  end
end
