class Venue < ApplicationRecord
  CATEGORIES = %w[network meet celebrate]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  validates :name, :address, :category, :capacity, presence: true

  validates :category, inclusion: { in: CATEGORIES }

  # validates :description, length: { maximum: 1000 }, allow_blank: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_facilities,
    against: [ :name, :facilities, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
