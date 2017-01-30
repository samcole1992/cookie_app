class ConsumersController < ApplicationController

  def index
    @user = current_user
    @reviews = @user.reviews
  end

  def edit
    @user = current_user

  end

  def update
    @user = current_user

  end



end
