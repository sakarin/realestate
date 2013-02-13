class AddCommentDetails < ActiveRecord::Migration
  def change
    add_column :comments, :name, :string
    add_column :comments, :telephone, :string
    add_column :comments, :email, :string

    add_column :comments, :comment_type, :string
    add_column :comments, :state, :string

  end
end
