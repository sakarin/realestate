# == Schema Information
#
# Table name: free_spaces
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FreeSpace < ActiveRecord::Base
  attr_accessible :name

  has_many :free_spaces_listings
  has_many :listings, through: :free_spaces_listings

  validates_presence_of :name
end
