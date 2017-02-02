class Api::V1::ReviewsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @reviews = Review.all
    # @review = @bar.reviews.find(params[:id])
    render json: @reviews
  end

  def destroy
    @review = Review.find(params[:id])
    @bar = Bar.find(params[:bar_id])
    @review.destroy
  end

end
