class CreateExpertUser < ActiveRecord::Migration
  def change
    create_table :experts_users do |t|
      t.integer :user_id
      t.integer :expert_id

      t.timestamps
    end
  end
end
