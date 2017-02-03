class Api::V1::OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @orders = Order.all
    render json: @orders
  end


end
