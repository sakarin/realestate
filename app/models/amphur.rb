class Amphur < ActiveRecord::Base
  attr_accessible :name
  has_many :districts
  belongs_to :province
end
