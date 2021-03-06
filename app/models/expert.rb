# == Schema Information
#
# Table name: experts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Expert < ActiveRecord::Base
  attr_accessible :name

  has_many :experts_users
  has_many :users, through: :experts_users

  validates_presence_of :name
end
