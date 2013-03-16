Factory.define :user do |user|
  #user.name                  "Admin Example"
  user.email                 "admin@example.com"
  user.password              "admin123"
  user.password_confirmation "admin123"
end

#Factory.sequence :email do |n|
#  "person-#{n}@example.com"
#end
#
#Factory.sequence :name do |n|
#  "Person #{n}"
#end
#
#Factory.define :micropost do |micropost|
#  micropost.content "Foo bar"
#  micropost.association :user
#end