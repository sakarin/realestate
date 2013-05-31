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
#  notice_news            :boolean
#  notice_property        :boolean
#  notice_new_property    :boolean
#  company                :string(255)
#  avatar                 :string(255)
#  agent_logo             :string(255)
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmed_at
  attr_accessible :role_ids

  # Additional
  attr_accessible :title, :first_name, :last_name, :telephone1, :telephone2, :fax, :address1, :address2, :postcode, :city
  attr_accessible :province_id, :country, :birth_date

  # Premium Agency
  attr_accessible :introduction, :service_and_expert, :web_site, :agency_logo, :company
  attr_accessible :notice_news, :notice_property, :notice_new_property

  attr_accessible :avatar, :avatar_cache
  attr_accessible :agent_logo, :agent_logo_cache

  attr_accessible :expert_ids

  has_many :experts_users
  has_many :experts, through: :experts_users

  has_many :listings

  has_many :comments

  mount_uploader :avatar, AvatarUploader
  mount_uploader :agent_logo, AgentLogoUploader



  # attr_accessible :title, :body
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

end
