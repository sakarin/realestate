class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :code
      t.string :name, :null => false, :default => ""
      t.integer :geo_id, :null => false, :default => 0

    end
  end
end
