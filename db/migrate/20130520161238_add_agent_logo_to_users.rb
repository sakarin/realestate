class AddAgentLogoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :agent_logo, :string
  end
end
