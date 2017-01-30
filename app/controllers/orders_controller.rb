require "pry"
class OrdersController < ApplicationController

  def index
    @user = current_consumer
    @reviews = @user.reviews
    @order = Order.new
    @providers = Provider.all
  end

  def show
    # binding.pry
    @user = current_user
    @order = Order.find(params[:id])
    @order.user = @user
    @pickup = ""
    if @order.pickup
      @pickup = "delivery"
    else
      @pickup = "pickup"
    end
  end

  def new
    @user = current_user
    @order = Order.new
    @order.user = @user
  end

  def create
    @user = current_user
    @order = Order.new(order_params)
    @order.user = @user
    # binding.pry
    if @order.save
      flash[:notice] = "Order created successfully!"
      redirect_to @user
    else
      flash.now[:notice] = @order.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:address, :city, :state, :zip, :allergies, :cookie_type, :cookie_amount, :payment)
  end
end
