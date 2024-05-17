class Chatroom < ApplicationRecord
  belongs_to :booking
  has_many :users, through: :messages
  has_many :messages
end
