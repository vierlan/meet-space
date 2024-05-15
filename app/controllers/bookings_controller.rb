class BookingsController < ApplicationController
  before_action :set_venue, only: [:create]
  before_action :set_booking, only: [:destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = @venue.bookings.new(booking_params)
    @booking.user = current_user

    authorize @booking

    if @booking.save
      redirect_to profile_path(current_user), notice: 'Booking was successfully created'
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to profile_path, notice: 'Booking was successfully destroyed.'
  end

  private

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
