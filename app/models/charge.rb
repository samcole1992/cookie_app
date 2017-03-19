require 'pry'
gem 'stripe'
class Charge < ApplicationRecord

  belongs_to :order

  attr_accessor :stripe_customer_token


  def process_payment
    customer = Stripe::Customer.create
                                       card: stripe_customer_token

    Stripe::Charge.create customer: customer.id,
                          amount: order.price * 100,
                          currency: 'usd'

  end

end
