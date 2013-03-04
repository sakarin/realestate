class CreateExpert < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :name

      t.timestamps
    end
  end
end
