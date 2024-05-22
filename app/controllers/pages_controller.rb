class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

  end

  def profile
    @user = current_user
    @venues = @user.venues
    # @bookings = @user.bookings

    @bookings = current_user.bookings.order(created_at: :desc)
    @chatrooms = current_user.chatrooms
    @requests = current_user.venues.flat_map { |venue| venue.bookings }.sort_by { |booking| booking.created_at }.reverse

    # @requests = current_user.venues.map{|venue| venue.bookings}.flatten

    # all of the bookings where the current user owns the venue
    @venue = Venue.last



  end
end
