class UserDetail < ActiveRecord::Base

  belongs_to :user

  # Additional
  attr_accessible :title, :first_name, :last_name, :telephone1, :telephone2, :fax, :address1, :address2, :postcode, :city
  attr_accessible :province_id, :country, :birth_date

  # Premium Agency
  attr_accessible :introduction, :service_and_expert, :web_site, :agency_logo
end
