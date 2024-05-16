require 'faker'
require 'open-uri'

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


categories = [:network, :meet, :celebrate]
facilities_array = [:wifi, :coffee, :tv, :pool, :tv, :spa, :music, :bar, :restaurant]
address_array = [ "116 New Oxford St, London WC1A 1HH", "49 Queensway, London W2 4QH", "51 Great Russell St, London WC1B 3BA", "G13, 381 Oxford St, London W1C 2JS", "S Colonnade, London E14 4QT",  "26 Pembridge Rd, Notting Hill Gate, London W11 3HL", "79 St John's Wood High St, London NW8 7NL", "12 A Mepham St, London SE1 8SE", "68 Victoria Rd, Surbiton KT6 4NR", "20 St John's Hill, London SW11 1RU" ]
10.times do |i|
  new_venue = Venue.new(
    name: Faker::Restaurant.unique.name,
    facilities: facilities_array.sample(4).map(&:to_s).join(", "),
    description: Faker::Restaurant.description,
    address: address_array[i % address_array.length],
    category: categories.sample,
    capacity: Faker::Number.between(from: 10, to: 100),
    user_id: User.ids.sample
    )
   3.times do
    random_number = rand(1..26)
    file = File.open "app/assets/images/venue_images/#{random_number}.jpg"

    new_venue.photos.attach(io: file, filename: "#{random_number}.jpg", content_type: "image/jpg")
   end
 

  new_venue.save
end



puts "Seeding completed!"
