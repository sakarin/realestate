# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  authentication_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string(255)
#  uid                    :string(255)
#  title                  :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  birth_date             :date
#  telephone1             :string(255)
#  telephone2             :string(255)
#  fax                    :string(255)
#  address1               :string(255)
#  address2               :string(255)
#  postcode               :string(255)
#  city                   :string(255)
#  province_id            :integer
#  country                :string(255)
#  introduction           :string(255)
#  service_and_expert     :string(255)
#  web_site               :string(255)
#  agency_logo            :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
