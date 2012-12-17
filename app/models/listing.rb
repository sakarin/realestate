class Listing < ActiveRecord::Base
  PROPERTY_TYPE = [:condo, :home, :townhouse, :land, :apartment]
  PRICE_TYPE = [:BAH, :BAM, :BASM, :BASW, :BAR, :POA, :GUI]
  TENURE = [:F, :L]
  FURNISHING = [:UNFUR, :PART, :FULL]
  FACING = [:NORTH, :NEAST, :NWEST, :EAST, :WEST, :SEAST, :SWEST, :SOUTH]



  attr_accessible :listing_type, :property_type, :listing_title_th, :listing_description_th
  attr_accessible :amphur_id, :district_id, :province_id
  attr_accessible :property_name, :street_number, :street_name, :post_code
  attr_accessible :price, :price_type, :tenure
  attr_accessible :lat_value, :lon_value
  attr_accessible :floorarea, :floorsize_x, :floorsize_y, :landarea_rai, :landarea_ngaan, :landarea_sqw, :landsize_x, :landsize_y

  attr_accessible :unit_feature_ids, :furniture_ids, :free_space_ids, :facility_ids
  attr_accessible :bedrooms, :extra_rooms, :bathrooms, :number_of_floors, :floor_position, :furnishing, :facing


  has_many :images

  belongs_to :user




  has_many :unit_features_listings
  has_many :unit_features, through: :unit_features_listings

  has_many :furnitures_listings
  has_many :furnitures, through: :furnitures_listings

  has_many :free_spaces_listings
  has_many :free_spaces, through: :free_spaces_listings

  has_many :facilities_listings
  has_many :facilities, through: :facilities_listings

  attr_writer :current_step

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
