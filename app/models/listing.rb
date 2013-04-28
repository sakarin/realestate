# == Schema Information
#
# Table name: listings
#
#  id                     :integer          not null, primary key
#  listing_type           :string(255)
#  property_type          :string(255)
#  listing_title_th       :string(255)
#  listing_description_th :string(255)
#  amphur_id              :integer
#  district_id            :integer
#  province_id            :integer
#  property_name          :string(255)
#  street_number          :string(255)
#  street_name            :string(255)
#  post_code              :string(255)
#  price                  :integer
#  price_type             :string(255)
#  tenure                 :string(255)
#  lat_value              :string(255)
#  lon_value              :string(255)
#  floorarea              :integer
#  floorsize_x            :integer
#  floorsize_y            :integer
#  landarea_rai           :integer
#  landarea_ngaan         :integer
#  landarea_sqw           :integer
#  landsize_x             :integer
#  landsize_y             :integer
#  bedrooms               :string(255)
#  extra_rooms            :string(255)
#  bathrooms              :string(255)
#  number_of_floors       :string(255)
#  floor_position         :string(255)
#  furnishing             :string(255)
#  facing                 :string(255)
#  user_id                :integer
#  status                 :string(255)
#  published_date         :datetime
#  expired_date           :datetime
#  notepad                :string(255)
#  comment                :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  state                  :string(255)
#  slug                   :string(255)
#  make_permalink         :string(255)
#  permalink              :string(255)
#

# ประกาศมีอายุ 90 วันนับจากวันลงประกาศหรือวันที่ต่ออายุล่าสุด โดยระบบจะแจ้งเตือนทางอีเมลก่อนประกาศหมดอายุ
# ระบบอนุญาตให้ต่ออายุหรือเลื่อนประกาศได้สัปดาห์ละ 1 ครั้ง
#
# -------------------------------------------------------------------
# - User Roles
# -------------------------------------------------------------------
# Package                      | trial  |starter |premium |platinum |
# -----------------------------+--------+--------+--------+---------+
# จำนวนประกาศ                  |  3     |   10   |  30    |  100    |
# จำนวนประกาศที่แสดงได้พร้อมๆกัน    |        |        |        |         |
# -------------------------------------------------------------------

class Listing < ActiveRecord::Base
  PROPERTY_TYPE = [:condo, :home, :townhouse, :land, :apartment]
  PRICE_TYPE = [:BAH, :BAM, :BASM, :BASW, :BAR, :POA, :GUI]
  TENURE = [:F, :L]
  FURNISHING = [:UNFUR, :PART, :FULL]
  FACING = [:NORTH, :NEAST, :NWEST, :EAST, :WEST, :SEAST, :SWEST, :SOUTH]


  attr_accessible :number, :listing_type, :property_type, :listing_title_th, :listing_description_th, :slug
  attr_accessible :amphur_id, :district_id, :province_id
  attr_accessible :property_name, :street_number, :street_name, :post_code
  attr_accessible :price, :price_type, :tenure
  attr_accessible :lat_value, :lon_value
  attr_accessible :floorarea, :floorsize_x, :floorsize_y, :landarea_rai, :landarea_ngaan, :landarea_sqw, :landsize_x, :landsize_y

  attr_accessible :unit_feature_ids, :furniture_ids, :free_space_ids, :facility_ids
  attr_accessible :bedrooms, :extra_rooms, :bathrooms, :number_of_floors, :floor_position, :furnishing, :facing
  attr_accessible :published_at

  # url friendly (see https://github.com/kaiuhl/pretty-param for details)
  has_pretty_param :slug

  belongs_to :district
  belongs_to :amphur
  belongs_to :province

  has_many :images, :order => "position"

  belongs_to :user


  has_many :unit_features_listings
  has_many :unit_features, through: :unit_features_listings

  has_many :furnitures_listings
  has_many :furnitures, through: :furnitures_listings

  has_many :free_spaces_listings
  has_many :free_spaces, through: :free_spaces_listings

  has_many :facilities_listings
  has_many :facilities, through: :facilities_listings

  has_many :comments, as: :commentable

  validates_presence_of :listing_title_th, :listing_type, :price
  validates_presence_of :amphur_id, :district_id, :province_id
  #validates_presence_of :floorarea
  #validates :permalink, :presence => true

  attr_writer :current_step


  scope :with_state, lambda { |s| where(:state => s) }

  scope :show, with_state('show')
  scope :hidden, with_state('hidden')
  scope :draft, with_state('draft')
  scope :exclusive, with_state('exclusive')

  #scope :number_of_draft, lambda { ||}

  # shipment state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine :initial => 'draft', :use_transactions => false do
    event :complete do
      transition :from => 'draft', :to => 'complete'
    end
    event :show do
      transition :from => 'complete', :to => 'show'
      transition :from => 'hidden', :to => 'show'
    end
    event :hidden do
      transition :from => 'show', :to => 'hidden'
      transition :from => 'complete', :to => 'hidden'
    end
    event :exclusive do
      transition :from => 'show', :to => 'exclusive'
      transition :from => 'complete', :to => 'exclusive'
    end
    after_transition :to => 'show', :do => :after_show
  end



  before_validation :generate_number #, :on => :create

  before_validation :generate_slug

  def generate_number
    record = true
    while record
      random = "#{Array.new(6){rand(6)}.join}"
      record = self.class.where(:number => random).first
    end
    self.number = random if self.number.blank?
    self.number
  end

  def generate_slug
    self.slug ||= listing_title_th
  end

  def after_show
    selt.published_at = Date.now
  end




  def current_step
    @current_step || steps.first
  end

  def steps
    %w[basic detail media summary]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end





end
