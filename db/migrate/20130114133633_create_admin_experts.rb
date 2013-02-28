class CreateAdminExperts < ActiveRecord::Migration
  def change
    create_table :admin_experts do |t|
      t.string :name

      t.timestamps
    end
  end
end
