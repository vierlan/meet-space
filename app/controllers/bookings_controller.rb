class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
    def index
      @user = params[:current_user]
      @bookings = Booking.all
    end

    def new
      @booking = Booking.new
      authorize @booking
      @venue = Venue.find(params[:venue_id])
     
    end

    def create
      @booking = Booking.new(booking_params)
      @venue = Venue.find(params[:venue_id])
      @booking.venue = @venue
      @booking.user = current_user
      authorize @booking
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
      params.require(:booking).permit(:booking_start, :booking_end, :comment)
    end
  end
