class Venue < ApplicationRecord
  CATEGORIES = %w[NETWORK MEET CELEBRATE]


  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :name, :address, :category, :capacity, presence: true

  validates :category, inclusion: { in: CATEGORIES }

  # before_destroy :destroy_all_bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_facilities,
    against: [ :name, :facilities, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
