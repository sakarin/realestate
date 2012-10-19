class FreeSpaces < ActiveRecord::Migration
  def change
    create_table :free_spaces do |t|
      t.string :name

      t.timestamps
    end
  end
end
