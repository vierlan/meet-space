class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @events = event.search_by_name_and_facilities(params[:query]).where.not(user: current_user)
    else
      @events = event.where.not(user: current_user)
    end
    policy_scope @events
    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event: event}),
        marker_html: render_to_string(partial: "marker", locals: {event: event})
      }
    end
  end

  def show
    authorize @event
      @review = Review.new
      @reviews = @event.reviews
      @booking = Booking.new
      @marker = {
        lat: @event.latitude,
        lng: @event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event: @event}),
        marker_html: render_to_string(partial: "marker", locals: {event: @event})
      }
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to event_path(@event), notice: "You have made a new event."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
def set_event
  @event = event.find(params[:id])
end
def event_params
  params.require(:event).permit(:title, :description, :ticket_price, :reoccuring, :require_payment, photos: [])
end
def authorize_event
  authorize @event
end
end
