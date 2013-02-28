class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :slug
      t.text :content
      t.references :post_group

      t.timestamps
    end
    add_index :posts, :post_group_id
  end
end
