# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130225214002) do

  create_table "amphurs", :force => true do |t|
    t.string  "code"
    t.string  "name",        :default => "", :null => false
    t.integer "geo_id",      :default => 0,  :null => false
    t.integer "province_id"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "name"
    t.string   "telephone"
    t.string   "email"
    t.string   "comment_type"
    t.string   "state"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "districts", :force => true do |t|
    t.string  "code"
    t.string  "name",        :default => "", :null => false
    t.integer "amphur_id"
    t.integer "province_id"
    t.integer "geo_id",      :default => 0,  :null => false
  end

  create_table "experts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "experts_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "expert_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "facilities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "facilities_listings", :force => true do |t|
    t.integer  "facility_id"
    t.integer  "listing_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "free_spaces", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "free_spaces_listings", :force => true do |t|
    t.integer  "free_space_id"
    t.integer  "listing_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "furnitures", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "furnitures_listings", :force => true do |t|
    t.integer  "furniture_id"
    t.integer  "listing_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.string   "attachment"
    t.integer  "position"
    t.integer  "listing_id"
    t.string   "session_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listings", :force => true do |t|
    t.string   "listing_type"
    t.string   "property_type"
    t.string   "listing_title_th"
    t.string   "listing_description_th"
    t.integer  "amphur_id"
    t.integer  "district_id"
    t.integer  "province_id"
    t.string   "property_name"
    t.string   "street_number"
    t.string   "street_name"
    t.string   "post_code"
    t.integer  "price"
    t.string   "price_type"
    t.string   "tenure"
    t.string   "lat_value"
    t.string   "lon_value"
    t.integer  "floorarea"
    t.integer  "floorsize_x"
    t.integer  "floorsize_y"
    t.integer  "landarea_rai"
    t.integer  "landarea_ngaan"
    t.integer  "landarea_sqw"
    t.integer  "landsize_x"
    t.integer  "landsize_y"
    t.string   "bedrooms"
    t.string   "extra_rooms"
    t.string   "bathrooms"
    t.string   "number_of_floors"
    t.string   "floor_position"
    t.string   "furnishing"
    t.string   "facing"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "published_date"
    t.datetime "expired_date"
    t.string   "notepad"
    t.string   "comment"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "state"
    t.string   "slug"
    t.string   "make_permalink"
    t.string   "permalink"
  end

  add_index "listings", ["make_permalink"], :name => "index_listings_on_make_permalink"
  add_index "listings", ["permalink"], :name => "index_listings_on_permalink"
  add_index "listings", ["slug"], :name => "index_listings_on_slug"

  create_table "post_groups", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "parent"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.integer  "post_group_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "posts", ["post_group_id"], :name => "index_admin_posts_on_post_group_id"

  create_table "provinces", :force => true do |t|
    t.string  "code"
    t.string  "name",   :default => "", :null => false
    t.integer "geo_id", :default => 0,  :null => false
  end

  create_table "redactor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], :name => "idx_redactor_assetable"
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_redactor_assetable_type"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "unit_features", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "unit_features_listings", :force => true do |t|
    t.integer  "unit_feature_id"
    t.integer  "listing_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "user_details", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "telephone1"
    t.string   "telephone2"
    t.string   "fax"
    t.string   "address1"
    t.string   "address2"
    t.string   "postcode"
    t.string   "city"
    t.integer  "province_id"
    t.string   "country"
    t.string   "introduction"
    t.string   "service_and_expert"
    t.string   "web_site"
    t.string   "agency_logo"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "telephone1"
    t.string   "telephone2"
    t.string   "fax"
    t.string   "address1"
    t.string   "address2"
    t.string   "postcode"
    t.string   "city"
    t.integer  "province_id"
    t.string   "country"
    t.string   "introduction"
    t.string   "service_and_expert"
    t.string   "web_site"
    t.string   "agency_logo"
    t.boolean  "notice_news"
    t.boolean  "notice_property"
    t.boolean  "notice_new_property"
  end

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
