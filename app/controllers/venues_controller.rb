class VenuesController < ApplicationController
  before_action :set_venue, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: :index

  def index
    @venues = Venue.all
    policy_scope @venues
    @pics = []
    Dir.entries('app/assets/images').each do |image|
      @pics << image
    end
  end

  def show
    authorize @venue
  end

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    authorize @venue
    if @venue.save
      redirect_to @venue, notice: "Venue has been sucessfully added to your porfolio."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to @venue
  end

  def destroy
    @venue.destroy
    redirect_to venues_path
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :capacity, :facilities, :category)
  end
end
