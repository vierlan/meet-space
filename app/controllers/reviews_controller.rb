class ReviewsController < ApplicationController
  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
    authorize @review
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @review = @venue.reviews.build(review_params)
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to @venue, notice: 'Review was successfully created.'
    else
      flash[:alert] = 'Something went wrong.'
      render :new, status: :unprocessable_entity
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
