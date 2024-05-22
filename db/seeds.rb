<<<<<<< Updated upstream
require 'faker'
require 'open-uri'

puts "Cleaning database..."
Message.destroy_all
Chatroom.destroy_all
=======

require 'faker'

puts "Cleaning database..."
>>>>>>> Stashed changes
Booking.destroy_all
Venue.destroy_all
User.destroy_all

puts "Creating users..."
<<<<<<< Updated upstream
users = [
  {
    first_name: 'Lan Anh',
    last_name: 'Nguyen',
    username: 'Lala',
    email: 'Lala@la.com',
    password: '123123'
  },
  {
    first_name: 'Rushana',
    last_name: 'Rushana',
    username: 'Rushana',
    email: 'Rushana@la.com',
    password: '123123'
  },
  {
    first_name: 'Catalin',
    last_name: 'Ursu',
    username: 'Catalin',
    email: 'Catalin@la.com',
    password: '123123'
  }
]

users.each do |user_data|
  User.create!(user_data)
end

categories = [:network, :meet, :celebrate]
facilities_array = [:wifi, :coffee, :tv, :pool, :tv, :spa, :music, :bar, :restaurant]
address_array = [
  "116 New Oxford St, London WC1A 1HH", "49 Queensway, London W2 4QH", "51 Great Russell St, London WC1B 3BA",
  "G13, 381 Oxford St, London W1C 2JS", "S Colonnade, London E14 4QT", "26 Pembridge Rd, Notting Hill Gate, London W11 3HL",
  "79 St John's Wood High St, London NW8 7NL", "12 A Mepham St, London SE1 8SE", "68 Victoria Rd, Surbiton KT6 4NR",
  "20 St John's Hill, London SW11 1RU"
]

image_urls = [
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1715943960/development/e5ugtni1whmznehyq3c51teqo1kx.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1715867709/development/q0sf3v6qgqymi501d7kfk75cg35g.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1715861459/development/66rb13qbdxkm0w518f2z3emavgak.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1715861458/development/7i359d30f5hgk15vqai8469u5zkh.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1715861456/development/vby9kn2lrso2pddpiowag8yg8wye.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160704/4_uzcqll.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160712/7_2_meeumh.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160712/7_up84xk.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160722/9_nqya9v.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160722/10_2_vjjohl.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160717/9_2_vacede.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160717/8_ydxbyd.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160717/8_2_y4bpt3.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160712/6_kxjsd8.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160703/4_2_vb9ek7.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160699/3_2_c692uo.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160699/2_2_rdtp14.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160695/1_2_ssdgdj.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160690/22_hbhet6.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160690/25_niddil.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160690/21_iwrvzd.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160690/20_vxsnuh.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160682/16_s7xvsn.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1715867709/development/bfykff3fnmj0icmwzl45pfk5j2rc.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160667/12_2_pmstl9.jpg",
  # Add more image URLs as needed
]

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
   5.times do
    random_number = rand(1..1000)
    image = image_urls.sample
    # file = File.open "app/assets/images/venue_images/#{random_number}.jpg"
    file = URI.open(image)

    new_venue.photos.attach(io: file, filename: "#{random_number}.jpg", content_type: "image/jpg")
    new_venue.save!
   end
  end
=======

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


venue_images = ["meet.jpg", "work.jpg", "celebration.jpg"]

categories = [:network, :meet, :celebrate]

10.times do |i|
  new_venue = Venue.new(
    name: Faker::Company.name,
    facilities: Faker::Lorem.words(number: 3).join(", "),
    address: Faker::Address.full_address,
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

puts "Creating bookings..."

5.times do
  Booking.create!(
    comment: Faker::Lorem.sentence,
    confirmed: false,
    user_id: User.ids.sample,
    venue_id: Venue.ids.sample
  )
end

>>>>>>> Stashed changes
puts "Seeding completed!"
