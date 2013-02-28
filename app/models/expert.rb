class Expert < ActiveRecord::Base
  attr_accessible :name

  has_many :experts_users
  has_many :users, through: :experts_users

  validates_presence_of :name
end
