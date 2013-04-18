# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  title            :string(50)       default("")
#  comment          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string(255)
#  telephone        :string(255)
#  email            :string(255)
#  comment_type     :string(255)
#  state            :string(255)
#

class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  attr_accessible :comment, :name, :telephone, :email, :title, :commentable_id

  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'



  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user


  scope :with_state, lambda { |s| where(:state => s) }
  scope :unread, with_state('unread')
  scope :read,   with_state('read')

  # shipment state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine :initial => 'unread', :use_transactions => false do
    event :read do
      transition :from => 'unread', :to => 'read'
    end
    #after_transition :to => 'shipped', :do => :after_ship
  end


  def self.find_all_comments(commentable_str, commentable_ids, status)
    where(["commentable_type = ? and commentable_id IN (?) and state = ? ", commentable_str, commentable_ids, status]).order("created_at DESC")
  end



end
