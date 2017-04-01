require 'pry'
require 'stripe'
class PaymentsController < ApplicationController

    # def new
    #   @order = Order.find(params[:order_id])
    #   @charge = Charge.new
    #   @charge.order_id = @order.id
    # end

    def create
      @user = current_user
      @payment = Payment.new(params[:id])
      @payment.user = @user

      customer = Stripe::Customer.create(
      :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => ((@charge.payment)*100),
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
      )
    if customer && charge
      flash[:notice] = "Payment successfull."
      @order.completion == true
      @order.baker.owed_money += @order.payment

    end
    redirect_to @user

        end


end
