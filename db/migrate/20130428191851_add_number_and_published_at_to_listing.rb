class AddNumberAndPublishedAtToListing < ActiveRecord::Migration
  def change
    add_column :listings, :number, :string
    add_column :listings, :published_at, :datetime
  end
end
