require 'pry'
class Charge < ApplicationRecord

  belongs_to :order

  attr_accessor :stripe_card_token


  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(
        charge: id, card: stripe_card_token)
        binding.pry
      self.stripe_customer_token = customer.id
      save!
    end
  end

end
