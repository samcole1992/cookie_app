require 'pry'
class Charge < ApplicationRecord

  belongs_to :order

  attr_accessor :stripe_card_token


  def save_with_payment
    Stripe.api_key = ENV["StripeKey"]

    begin
      if valid?
        customer = Stripe::Customer.create(
          charge: id, card: stripe_card_token)
        self.stripe_customer_token = customer.id
        save!
        # binding.pry
        #
        # charge = Stripe::Charge.create(
        #   :amount => (@order.amount * 100).floor,
        #   :description => 'charge.create',
        #   :currency => "usd",
        #   :customer => @order.consumer.id,
        #   :source => card.id
        #   )

      end
end
  end

end
