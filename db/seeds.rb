# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

chair = User.find_or_create_by_email :name => 'Kati Berg', :email => 'katiberg@kw.com', :password => 'changeme', :password_confirmation => 'changeme'
puts 'user: ' << chair.name
chair.add_role :board

board1 = User.find_or_create_by_email :name => 'Julie Eyrich', :email => 'julie_eyrich@msn.com', :password => 'changeme', :password_confirmation => 'changeme'
puts 'user: ' << board1.name
board1.add_role :board

board2 = User.find_or_create_by_email :name => 'Andrew Maselli', :email => 'andrewmaselli@gmail.com', :password => 'changeme', :password_confirmation => 'changeme'
puts 'user: ' << board2.name
board2.add_role :board

board2 = User.find_or_create_by_email :name => 'Megan Maselli', :email => 'meganmaselli3@gmail.com', :password => 'changeme', :password_confirmation => 'changeme'
puts 'user: ' << board2.name
board2.add_role :board
