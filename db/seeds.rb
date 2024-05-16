require 'faker'
require "open-uri"

puts "Cleaning database..."
Booking.destroy_all
Venue.destroy_all
User.destroy_all

puts "Creating users..."

3.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = "#{first_name.downcase}_#{last_name.downcase}_#{i + 1}"
  email = Faker::Internet.email(name: "#{first_name} #{last_name}", separators: '.', domain: 'example.com')
  password = 123123

  User.create!(
    first_name: first_name,
    last_name: last_name,
    username: username,
    email: email,
    password: password
  )
end

image_directory = "app/assets/images/"
venue_images = ["meet.png"]
categories = [:network, :meet, :celebrate]
facilities_array = [:wifi, :coffee, :tv, :pool, :beach, :spa]

3.times do |i|
  new_venue = Venue.new(
    name: Faker::Restaurant.unique.name,
    facilities: facilities_array.sample(3).map(&:to_s).join(", "),
    address: "10 Mulberry walk, southampton, SO15 5GA",
    category: categories.sample,
    capacity: Faker::Number.between(from: 10, to: 100),
    user_id: User.ids.sample
  )

  image_filename = venue_images.sample
  image_path = File.join(image_directory, image_filename)

  if File.exist?(image_path)

    new_venue.photos.attach(io: File.open(image_path), filename: image_filename, content_type: "image/jpeg")
  else
    puts "Image file not found: #{image_path}"
  end

  new_venue.save
end

# puts "Creating bookings..."

# 5.times do
#   Booking.create!(
#     comment: Faker::Lorem.sentence,
#     confirmed: false,
#     user_id: User.ids.sample,
#     venue_id: Venue.ids.sample
#   )
# end

puts "Seeding completed!"
