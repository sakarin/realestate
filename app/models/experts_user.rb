# == Schema Information
#
# Table name: experts_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  expert_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExpertsUser < ActiveRecord::Base
  belongs_to :expert
  belongs_to :user
end
