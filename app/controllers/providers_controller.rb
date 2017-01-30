class ProvidersController < ApplicationController

  def index
    @user = current_user
    @orders = Order.all
    @order = Order.find(params[:id])
    @reviews = @user.reviews
  end

  def edit
    @user = current_user

  end

  def update
    @user = current_user

  end
end
