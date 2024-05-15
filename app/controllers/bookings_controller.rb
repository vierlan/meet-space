class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  skip_before_action :authenticate

  def index
    @user = params[:current_user]
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @venue = Venue.find(params[:venue_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @venue = Venue.find(params[:venue_id])
    @booking.venue = @venue
    @booking.user = current_user
    if @booking.save
    redirect_to profile_path(current_user), notice: "Your request has been sent!  Awaiting confirmation."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :comment)
  end
end
