require 'geokit'
require 'pry'
class Api::V1::OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @user = current_user

    orders = Order.all

    orders.each do |order|
      a=Geokit::Geocoders::GoogleGeocoder.geocode "#{order.consumer.street}, #{order.consumer.city}, #{order.consumer.state}"
      b= Geokit::Geocoders::GoogleGeocoder.geocode "#{@user.street}, #{@user.city}, #{@user.state}"
      c = a.distance_to(b)
      order.distance =c.round(2)
    end
    orderlist= orders.sort_by{|v|v["distance"]}
    orderlist1 = orderlist.delete_if { |h| h["distance"]==0}
    orderlist2 = orderlist1.delete_if { |h| h["fulfilled"]===true}
     @orders =orderlist2
     binding.pry
    render json: @orders
  end
end
