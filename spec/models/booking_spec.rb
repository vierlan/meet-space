require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'Chatroom creation' do
    let(:user) { create(:user) }
    let(:venue_owner) { create(:user) }
    let(:venue) { create(:venue, user: venue_owner) }

    it 'creates a chatroom with initial messages for booking user and venue owner' do
      booking = Booking.create!(user: user, venue: venue, confirmed: false)
      chatroom = booking.chatroom

      expect(chatroom).to be_present
      expect(chatroom.users).to include(user, venue_owner)

      initial_messages = chatroom.messages
      expect(initial_messages.count).to eq(2)
      expect(initial_messages.map(&:user)).to include(user, venue_owner)
    end
  end
end
