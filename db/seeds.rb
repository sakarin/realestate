# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING ROLES'
Role.create([
                { :name => 'admin' },
                { :name => 'trial' },
                { :name => 'starter' },
                { :name => 'premium' },
                { :name => 'platinum' }
            ], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :email => 'admin@example.com', :password => 'admin123', :password_confirmation => 'admin123', :confirmed_at => Time.now
user.add_role :admin
puts 'New user created: ' << user.email

user2 = User.create! :email => 'trial@example.com', :password => '123456', :password_confirmation => '123456', :confirmed_at => Time.now
puts 'New user created: ' << user2.email
user2.add_role :trial

user3 = User.create! :email => 'starter@example.com', :password => '123456', :password_confirmation => '123456', :confirmed_at => Time.now
puts 'New user created: ' << user3.email
user3.add_role :starter


