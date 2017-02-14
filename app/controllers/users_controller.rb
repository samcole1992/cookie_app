require 'pry'
require 'geokit'
require 'httparty'
require 'json'
class UsersController < ApplicationController
  def index
    @user = current_user
    @orders = Order.where(consumer_id: @user.id)
    @users = User.all

  end

  def show

    @baker = User.find(params[:id])
    @user = current_user
    key = ENV["FOOD2FORK_KEY"]
    response = HTTParty.get("http://food2fork.com/api/search?key=#{key}&q=cookies")
    parsed = JSON.parse(response)
    @recipes = parsed["recipes"]


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
    params.permit(:rating, :body, :provider_id, :consumer_id)
  end

end
