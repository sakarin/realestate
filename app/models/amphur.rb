# == Schema Information
#
# Table name: amphurs
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  name        :string(255)      default(""), not null
#  geo_id      :integer          default(0), not null
#  province_id :integer
#

class Amphur < ActiveRecord::Base

  attr_accessible :name
  has_many :districts
  belongs_to :province
  has_one :listing

  #default_scope order('name ASC')

end
