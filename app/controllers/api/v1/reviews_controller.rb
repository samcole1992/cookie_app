require "pry"
class Api::V1::ReviewsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @reviews = Review.all
    render json: @reviews
  end

  def show
    binding.pry
    @baker = User.find(params[:id])
    @baker = User.find_by(id: @baker.id)
    reviewlist = Review.where(provider_id: baker_id)
    reviewlist1= reviewlist.sort_by{|v|v["rating"]}
    @reviews = reviewlist1.delete_if { |h| h["provider_id"]!=baker_id}
    render json: @reviews
  end

  def destroy
    @review = Review.find(params[:id])
    @bar = Bar.find(params[:bar_id])
    @review.destroy
  end

end
