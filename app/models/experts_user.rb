class ExpertsUser < ActiveRecord::Base
  belongs_to :expert
  belongs_to :user
end