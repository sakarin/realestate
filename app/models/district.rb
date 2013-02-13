# == Schema Information
#
# Table name: districts
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  name        :string(255)      default(""), not null
#  amphur_id   :integer
#  province_id :integer
#  geo_id      :integer          default(0), not null
#

class District < ActiveRecord::Base
  attr_accessible :name
  belongs_to :province
  belongs_to :amphur
end
