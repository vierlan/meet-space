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
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipMq5-1fHLnbvHdp1_HeU_yiwviiIrWb7agVy1fC?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipMvo5fKliGqrNIrCf9DRzWQk0G4G56FQYDGFqhy?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipMTV73wEMDKSrf6_tmmmAgWJugL6am14cwzDqam?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipO_96WLdjy1j7PzKeQ6wEcmwkmelyb_YKAW_CWC?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipMqAzg2CsAmG5wa2LSn-XxrcqQjyZy-D_03RinJ?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipP--M5As9CplSiE3M76LlY4Fv120llZ4-JjfKR2?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipMkOqhmzIhjubis393TSqTVOQP3UA1dZaUz6Tqf?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipPGoc8FkJxYtvK2nCgkTvVxhYYhlCy-0f0BSjPd?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipMN8SSsQv5vS9RKDeDD_0pYIPSiANu64YWFKFfM?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipM9UuGldY_CCYMSKqhDrtcIQa3z2u6yF2YrXX7b?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipMUBAcX34VeyrbCYwO_1uRZd5bwQYVQ2TH7iNHw?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipM9UuGldY_CCYMSKqhDrtcIQa3z2u6yF2YrXX7b?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipM11G0rSIEeJU7phQItesKqryZovjM2igpMxRvf?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R",
  "https://photos.google.com/share/AF1QipOmpfXDZukYnZoWXfy7ygecfWtqalmpTXZ_I_mbdtvBezXl6xVaO08MmbYKLPTVNQ/photo/AF1QipMNY7v_lKY88urS9ra4_5u02_L7Ro2i2IOx3qfr?key=Q3Y1alNSLUtuSGp6RUlzeWhhSGE3UmNBUjVyRW1R"

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
    user: User.all.sample
  )

  3.times do
    image_url = image_urls.sample
    file = URI.open(image_url)
    new_venue.photos.attach(io: file, filename: File.basename(URI.parse(image_url).path), content_type: 'image/jpg')
  end

  new_venue.save!
end

puts "Seeding completed!"
