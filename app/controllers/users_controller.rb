require 'pry'
require 'geokit'
require 'httparty'
class UsersController < ApplicationController
  def index
    @user = current_user
    @orders = Order.where(consumer_id: @user.id)
    @users = User.all

  end

  def show
    a = request.original_url
    baker_id = a[-1].to_i
    @baker = User.find_by(id: baker_id)
    @user = current_user
    response = HTTParty.get("http://food2fork.com/api/search?key={06560de398a0c7f695ec038ce5ad9927}&q=shredded%20chicken")
    # binding.pry

    @reviews = Review.where(provider_id: @baker.id)
    @review = Review.new(review_params)

    @review.provider = @baker
    @review.consumer = @user
    rating = 0
    count = 0

      @reviews.each do |review|
        unless review.rating == nil
        rating += review.rating
        count += 1
      end
      end
    b= rating.to_f / count.to_f
    @average = b.round(1)
  end

  private

  def review_params
    params.permit(:rating, :body)
  end



end
