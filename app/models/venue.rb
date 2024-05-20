class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :capacity, presence: true
  validates :description, length: { maximum: 500 }, allow_blank: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_facilities,
    against: [ :name, :facilities, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
