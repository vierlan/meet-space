class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @user = current_user
    @venues = @user.venues
    @bookings = @user.bookings

    @requests = current_user.venues.map{|venue| venue.bookings}.flatten

    # all of the bookings where the current user owns the venue
    @venue = Venue.last
  end
end
