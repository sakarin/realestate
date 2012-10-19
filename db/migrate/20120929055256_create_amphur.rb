class CreateAmphur < ActiveRecord::Migration
  def change
    create_table(:amphurs) do |t|
      t.string :code
      t.string :name, :null => false, :default => ""
      t.integer :geo_id, :null => false, :default => 0
      t.references :province
    end
  end

end
