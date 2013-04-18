FactoryGirl.define do
  factory :user do
    #name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
  end

  factory :role do
    name 'admin'
  end

  factory :unit_feature do
    name 'feature1'
  end
end