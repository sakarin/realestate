# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  slug          :string(255)
#  content       :text
#  post_group_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :post_group_id
  belongs_to :post_group
  attr_accessible :content, :name, :slug
end
