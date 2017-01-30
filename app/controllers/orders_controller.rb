class OrdersController < ApplicationController

  def index
    @user = current_user
    @reviews = @user.reviews
    @order = Order.new
    @providers = Provider.all
  end

  def show
    @user = current_user
    @order = Order.find(params[:id])
    @order.user = @user
    

  end

  def create
    @user = current_user
    @order = Order.new(order_params)
    @order.user = @user
    if @order.save
      flash[:notice] = "Order created successfully!"
      redirect_to consumers_path
    else
      flash.now[:notice] = @order.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:address, :city, :state, :zip, :allergies, :term)
  end
end
