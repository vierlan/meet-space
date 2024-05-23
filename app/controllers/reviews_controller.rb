class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
    @venue = Venue.find(params[:venue_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.venue = Venue.find(params[:venue_id])
    authorize @review
    if @review.save
      redirect_to venue_path(@review.venue)
    else
      render :new, status: :unprocessable_entity
      flash[:alert] = "Something went wrong."
    end
  end


    # def show
    #   @venue = Venue.find(params[:id])
    #   @reviews = @venue.reviews
    # end


  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
