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

  validates_presence_of :name
  validates :slug, uniqueness: true, presence: true,
            exclusion: {in: %w[signup login]}

  before_validation :generate_slug

  # url friendly (see https://github.com/kaiuhl/pretty-param for details)
  has_pretty_param :slug





  def generate_slug
    self.slug ||= name
    puts ""
  end

end
