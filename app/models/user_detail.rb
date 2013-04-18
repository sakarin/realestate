# == Schema Information
#
# Table name: user_details
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  first_name         :string(255)
#  last_name          :string(255)
#  birth_date         :date
#  telephone1         :string(255)
#  telephone2         :string(255)
#  fax                :string(255)
#  address1           :string(255)
#  address2           :string(255)
#  postcode           :string(255)
#  city               :string(255)
#  province_id        :integer
#  country            :string(255)
#  introduction       :string(255)
#  service_and_expert :string(255)
#  web_site           :string(255)
#  agency_logo        :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class UserDetail < ActiveRecord::Base

  belongs_to :user

  # Additional
  attr_accessible :title, :first_name, :last_name, :telephone1, :telephone2, :fax, :address1, :address2, :postcode, :city
  attr_accessible :province_id, :country, :birth_date

  # Premium Agency
  attr_accessible :introduction, :service_and_expert, :web_site, :agency_logo
end
