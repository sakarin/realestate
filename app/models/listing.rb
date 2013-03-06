

class Listing < ActiveRecord::Base
  PROPERTY_TYPE = [:condo, :home, :townhouse, :land, :apartment]
  PRICE_TYPE = [:BAH, :BAM, :BASM, :BASW, :BAR, :POA, :GUI]
  TENURE = [:F, :L]
  FURNISHING = [:UNFUR, :PART, :FULL]
  FACING = [:NORTH, :NEAST, :NWEST, :EAST, :WEST, :SEAST, :SWEST, :SOUTH]


  attr_accessible :listing_type, :property_type, :listing_title_th, :listing_description_th, :slug
  attr_accessible :amphur_id, :district_id, :province_id
  attr_accessible :property_name, :street_number, :street_name, :post_code
  attr_accessible :price, :price_type, :tenure
  attr_accessible :lat_value, :lon_value
  attr_accessible :floorarea, :floorsize_x, :floorsize_y, :landarea_rai, :landarea_ngaan, :landarea_sqw, :landsize_x, :landsize_y

  attr_accessible :unit_feature_ids, :furniture_ids, :free_space_ids, :facility_ids
  attr_accessible :bedrooms, :extra_rooms, :bathrooms, :number_of_floors, :floor_position, :furnishing, :facing

  # url friendly (see https://github.com/kaiuhl/pretty-param for details)
  has_pretty_param :slug


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
  #validates :permalink, :presence => true

  attr_writer :current_step


  scope :with_state, lambda { |s| where(:state => s) }
  scope :unread, with_state('complete')
  scope :read, with_state('show')
  scope :read, with_state('hidden')
  scope :read, with_state('draft')

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
    #after_transition :to => 'shipped', :do => :after_ship
  end

  before_validation :generate_slug

  def generate_slug
    self.slug ||= listing_title_th
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
