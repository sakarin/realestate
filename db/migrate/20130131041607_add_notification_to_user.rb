class AddNotificationToUser < ActiveRecord::Migration
  def change
    add_column :users, :notice_news, :boolean
    add_column :users, :notice_property, :boolean
    add_column :users, :notice_new_property, :boolean
  end
end
