# == Schema Information
#
# Table name: provinces
#
#  id     :integer          not null, primary key
#  code   :string(255)
#  name   :string(255)      default(""), not null
#  geo_id :integer          default(0), not null
#

class Province < ActiveRecord::Base
  attr_accessible :name
  has_many :districts
  has_many :amphurs

  has_one :listing

  #default_scope order('name ASC')
end
