# == Schema Information
#
# Table name: post_groups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  slug        :string(255)
#  parent      :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PostGroup < ActiveRecord::Base
  attr_accessible :description, :name, :parent, :slug
end
