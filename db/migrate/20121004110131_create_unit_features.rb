class CreateUnitFeatures < ActiveRecord::Migration
  def change
    create_table :unit_features do |t|
      t.string :name

      t.timestamps
    end
  end
end
