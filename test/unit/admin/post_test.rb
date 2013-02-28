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

require 'test_helper'

class Admin::PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
