require 'pry'
class UsersController < ApplicationController

  def index
    @user = current_user
    @orders = Order.all

    @reviews = @user.reviews

    # binding.pry
  end

  def show
    @user = current_user
    @reviews = @user.reviews
    @orders = Order.all
    # binding.pry
  end


  def edit
    @user = current_user

  end

  def update
    @user = current_user

  end



end
