require 'pry'
require 'stripe'
class Charge < ApplicationRecord

  belongs_to :order

  attr_accessor :stripe_customer_token

end
