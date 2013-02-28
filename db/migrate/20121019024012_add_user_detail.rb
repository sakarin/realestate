class AddUserDetail < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :telephone1, :string
    add_column :users, :telephone2, :string
    add_column :users, :fax, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :postcode, :string
    add_column :users, :city, :string
    add_column :users, :province_id, :integer
    add_column :users, :country, :string

    add_column :users, :introduction, :string
    add_column :users, :service_and_expert, :string
    add_column :users, :web_site, :string
    add_column :users, :agency_logo, :string
  end
end
