require "rails_helper"

order_one = Order.create(cookie_type: "Oatmeal", cookie_amount: "123", payment: "100", consumer_id: 1)

RSpec.describe Order, :type => :model do

  it "is valid with a payment" do
    expect(order_one.payment).to eq("100")
  end

  it "is valid with a cookie type" do
    expect(order_one.cookie_type).to eq("Oatmeal")
  end

  it "is valid with a cookie amount" do
    expect(order_one.cookie_amount).to eq("123")
  end

  it "is valid with a state" do
    expect(uesr_one.state).to eq("MA")
  end

  it "is not valid without a name" do
    bad_order = Order.new(cookie_type: nil)
    expect(bad_order).to_not be_valid
  end

  it "is valid without allergies" do
    good_order = Order.new(allergies: nil)
    expect(good_order).to_be valid
  end

end
