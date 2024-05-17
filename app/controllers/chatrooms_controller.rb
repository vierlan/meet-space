class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom)
    # @chatrooms = Chatroom.where(booking_id: current_user.bookings || current_user.venues.bookings)
    user_booking_ids = current_user.bookings.pluck(:id)
    venue_booking_ids = Booking.where(venue_id: current_user.venues.pluck(:id)).pluck(:id)
    combined_booking_ids = user_booking_ids + venue_booking_ids

    @chatrooms = Chatroom.where(booking_id: combined_booking_ids)

  end

  def create
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.find(params[:booking_id])
    @chatroom = Chatroom.new
    authorize @chatroom
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  def show

    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
    @chatrooms = policy_scope(Chatroom)
  end
end
