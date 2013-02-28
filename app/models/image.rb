# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  attachment :string(255)
#  position   :integer
#  listing_id :integer
#  session_id :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ActiveRecord::Base
  acts_as_list


  attr_accessible :attachment, :listing_id, :name, :position, :session_id
  mount_uploader :attachment, ImageUploader

  belongs_to :listing



  before_create :default_name

  def default_name
    self.name ||= File.basename(attachment.filename, '.*').titleize if attachment
  end
end
