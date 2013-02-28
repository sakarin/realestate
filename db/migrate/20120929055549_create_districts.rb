class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :code
      t.string :name, :null => false, :default => ""
      t.references :amphur
      t.references :province
      t.integer :geo_id, :null => false, :default => 0


    end
  end
end
