require "pry"
class OrdersController < ApplicationController

  def index
    @user = current_user
    @reviews = @user.reviews
    @order = Order.new
  end

  def show
    # binding.pry
    @order = Order.find(params[:id])
    @user = current_user
    @pickup = ""
    if @order.pickup
      @pickup = "pickup"
    else
      @pickup = "delivery"
    end
  end

  def new
    @user = current_user
    @order = Order.new
    @order.consumer = @user
    @pickup = ""
    if @order.pickup
      @pickup = "delivery"
    else
      @pickup = "pickup"
    end

  end

  def create
    @user = current_user
    @order = Order.new(order_params)
    @order.consumer = @user
    @pickup = ""
    if @order.pickup
      @pickup = "delivery"
    else
      @pickup = "pickup"
    end
    # binding.pry

    if @order.save
      flash[:notice] = "Order created successfully!"
      redirect_to @user
    else
      # binding.pry
      flash.now[:notice] = @order.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @user = current_user
    @order = Order.find(params[:id])
    @order.provider = @user
    if @order.update(order_params)
      flash[:notice] = "Order Accepted!"
      redirect_to @user
    else
      flash.now[:notice] = @order.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:address, :city, :state, :zip, :allergies, :cookie_type, :cookie_amount, :payment, :fulfilled)
  end

end
