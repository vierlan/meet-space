require 'faker'
require 'open-uri'

puts "Cleaning database..."
Message.destroy_all
Chatroom.destroy_all
Booking.destroy_all
Venue.destroy_all
User.destroy_all

puts "Creating users..."
users = [
  {
    first_name: 'Lan Anh',
    last_name: 'Nguyen',
    username: 'Alex',
    email: 'Lala@la.com',
    password: '123123'
  },
  {
    first_name: 'Rushana',
    last_name: 'Rushana',
    username: 'Racheal',
    email: 'Rushana@la.com',
    password: '123123'
  },
  {
    first_name: 'Catalin',
    last_name: 'Ursu',
    username: 'Bobby',
    email: 'Catalin@la.com',
    password: '123123'
  },
  {
    first_name: 'Mariana',
    last_name: 'Mariana',
    username: 'Mariana',
    email: 'mari@la.com',
    password: '123123'
  },
  {
    first_name: 'Mariana',
    last_name: 'Mariana',
    username: 'Cindy',
    email: 'Larry@la.coom',
    password: '123123'
  },
]

users.each do |user_data|
  User.create!(user_data)
end

categories = [:network, :meet, :celebrate]
facilities_array = [:wifi, :coffee, :tv, :pool, :tv, :spa, :music, :bar, :restaurant]
address_array = [
  "116 New Oxford St, London WC1A 1HH", "49 Queensway, London W2 4QH", "51 Great Russell St, London WC1B 3BA",
  "299 Borough High St, London SE1 1JG", "S Colonnade, London E14 4QT",
  "79 St John's Wood High St, London NW8 7NL", "12 A Mepham St, London SE1 8SE", "68 Victoria Rd, Surbiton KT6 4NR",
  "20 St John's Hill, London SW11 1RU", "4 St James's Mkt, St. James's, London SW1Y 4AH", " 69-73 St John St, London EC1M 4NJ"
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
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160675/13_2_hdgxwr.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160682/15_2_q6f2u1.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160686/17_wh6q1n.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160690/21_iwrvzd.jpg",
  "https://res.cloudinary.com/dcu31xcxz/image/upload/v1716160708/6_2_h2msqz.jpg"

  # Add more image URLs as needed
]

user = User.create!(first_name: "Cat", last_name: "Ursu", username: "Cat", email: "cat@la.com", password: "123123")

Venue.create!(user: user, name: "The Brewhouse", address: "397-400 Geffrye St, London E2 8HZ", category: "meet", capacity: 10, facilities: "wifi, coffee, tv, pool", description: "The Brewhouse is the purrfect place to meet and network with other coding lovers.")

15.times do |i|
  new_venue = Venue.new(
    name: Faker::Restaurant.unique.name,
    facilities: facilities_array.sample(4).map(&:to_s).join(", "),
    description: Faker::Restaurant.description,
    address: address_array[i % address_array.length],
    category: categories.sample,
    capacity: Faker::Number.between(from: 10, to: 100),
    user_id: User.ids.sample
    )
  4.times do
    random_number = rand(1..1000)
    image = image_urls.sample
    # file = File.open "app/assets/images/venue_images/#{random_number}.jpg"
    file = URI.open(image)

    new_venue.photos.attach(io: file, filename: "#{random_number}.jpg", content_type: "image/jpg")
    new_venue.save!
  end
end
puts "Venues done!"
puts "Creating bookings..."
venues = Venue.all

message = ["Would it be possible to book this venue for 10 people on Friday?", "Can I book this venue for a birthday party?", "I would like to book this venue for a networking event.",
           "Can I book this venue for a meeting?", "Would it be possible to book this venue for a celebration?", "I would like to book this venue for a team building event.",
           "Can I book this venue for a conference?", "Would it be possible to book this venue for a workshop?", "I would like to book this venue for a seminar.",
           "Can I book this venue for a training event?", "Would it be possible to book this venue for a product launch?", "I would like to book this venue for a hackathon.",
           "Can I book this venue for a workshop?", "Would it be possible to book this venue for a team building event?", "I would like to book this venue for a conference.",
           "Can I book this venue for a networking event?", "Would it be possible to book this venue for a meeting?", "I would like to book this venue for a seminar.",
           "Can I book this venue for a training event?", "Would it be possible to book this venue for a product launch?", "I would like to book this venue for a hackathon."]
           require 'faker'

           # Sample messages array for comments
           message = ["Meeting", "Conference", "Workshop", "Private Event"]

  venues.each do |venue|
    2.times do
      booking = Booking.new(
        booking_date: Faker::Date.between(from: Date.today - 23.days, to: Date.today + 23.days),
        start_time: Faker::Time.between(from: Time.now.beginning_of_day + 6.hours, to: Time.now.noon).strftime("%H:%M:00"),
        end_time: Faker::Time.between(from: Time.now.noon, to: Time.now.end_of_day).strftime("%H:%M:00"),
        comment: message.sample,
        user: User.all.sample,
        venue: venue
      )
      booking.save(validate: false)
    end
  end

puts "Creating reviews..."
venues.each do | venue |
  4.times do
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: Faker::Number.between(from: 2, to: 5),
      user: User.all.sample,
      venue: venue
    )
    review.save!
  end
end

puts "Seeding completed!"
