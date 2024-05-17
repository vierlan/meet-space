class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  has_one :chatroom, dependent: :destroy

  after_create :create_chatroom_with_initial_message

  private

  def create_chatroom_with_initial_message
    chatroom = Chatroom.create!(
      name: "Chatroom for Booking #{id}",
      booking: self
    )

    # Create an initial message to establish the relationship between users and chatroom
    Message.create!(
      content: "Chatroom created for booking #{id}",
      user: user, # Booking user
      chatroom: chatroom
    )

    Message.create!(
      content: "Chatroom created for booking #{id}",
      user: venue.user, # Venue owner
      chatroom: chatroom
    )
  end

end
