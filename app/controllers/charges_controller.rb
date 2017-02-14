require 'pry'
class ChargesController < ApplicationController

    def new
      order = Order.find(params[:order_id])
      @charge = Charge.new
      @charge.order_id = params[:order_id]

    end

    def create
      @user = current_user
      @charge = Charge.new(params[:id])
      @charge.order_id = params[:charge][:order_id]
      @charge.payment = @charge.order.payment
      @order = @charge.order
      if @charge.save_with_payment
        flash[:notice] = "Payment successful!"
        redirect_to @order
      else
        render :new
      end
    end


end
