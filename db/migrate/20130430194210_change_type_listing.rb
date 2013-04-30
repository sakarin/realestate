class ChangeTypeListing < ActiveRecord::Migration
  def change
    change_column(:listings, :listing_description_th, :text)
    change_column(:listings, :notepad, :text)
    change_column(:listings, :comment, :text)
  end
end
