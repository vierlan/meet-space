class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

  end

  def profile
    @user = current_user
    @venues = @user.venues
    @bookings = @user.bookings
    @venue = Venue.last
  end
end
