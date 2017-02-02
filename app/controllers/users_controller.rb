require 'pry'
class UsersController < ApplicationController

  def index
    @user = current_user
    @orders = Order.where(consumer_id: @user.id)
    @reviews = @user.reviews

  end

  def show
    a = request.original_url
    baker_id = a[-1].to_i
    @baker = User.find_by(id: baker_id)
    @reviews = Review.where(provider_id: @baker.id)
    # binding.pry
    @review = Review.new(review_params)
    @user = current_user

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
    @average = rating.to_f / count.to_f
  #     if @review.save
  #       flash[:notice] = "Review created successfully!"
  #       render :show
  #     else
  #       flash[:notice] = @review.errors.full_messages.to_sentence
  #       render :show
  #     end
  #
  end

  private

  def review_params
    params.permit(:rating, :body)
  end


end
