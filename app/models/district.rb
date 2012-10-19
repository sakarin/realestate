class District < ActiveRecord::Base
  attr_accessible :name
  belongs_to :province
  belongs_to :amphur
end
