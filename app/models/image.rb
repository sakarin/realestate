class Image < ActiveRecord::Base
  attr_accessible :attachment, :listing_id, :name, :position, :session_id
  mount_uploader :attachment, ImageUploader

  belongs_to :listing

  before_create :default_name

  def default_name
    self.name ||= File.basename(attachment.filename, '.*').titleize if attachment
  end
end
