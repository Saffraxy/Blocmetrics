# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#require 'random_data'

#Create Users
5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
#  user.skip_confirmation!
  user.save!
end
users = User.all

#create registered apps;
20.times do
  RegisteredApplication.create!(
  user: users.sample,
  name: Faker::Internet.domain_name,
  url: Faker::Internet.url
  )
end

puts "Seed Finished"
puts "#{RegisteredApplication.count} applications registered"
