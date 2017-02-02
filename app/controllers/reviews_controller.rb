class ReviewsController < ApplicationController

  def create
    a = request.original_url
    baker_id = a[-9].to_i
    @baker = User.find_by(id: baker_id)
    @user = current_user


    @review = Review.create(review_params)
    @review.provider = @baker
    @review.consumer = @user

    if @review.save

      flash[:notice] = "Review created successfully!"
      redirect_to @baker
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render @baker
    end

  end
  private

  def review_params
  params.require(:review).permit(:rating, :body)
  end


end
