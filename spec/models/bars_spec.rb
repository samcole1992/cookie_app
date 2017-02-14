require "rails_helper"


user_one = User.create(first_name: "Sam", last_name: "Cole", street: "1 Here St.", state: "MA", city: "",email: "sam@gmail.com", encrypted_password: "ththth")
order_one = Order.create(cookie_type: "Oatmeal", cookie_amount: "123")

RSpec.describe User, :type => :model do

  it "is valid with a first name" do
    expect(user_one.first_name).to eq("Sam")
  end
  #
  # it "is valid with a address" do
  #   expect(bar_one.address).to eq("123 Summer Street")
  # end
  #
  # it "is valid with a city" do
  #   expect(bar_one.city).to eq("Boston")
  # end
  #
  # it "is valid with a state" do
  #   expect(bar_one.state).to eq("MA")
  # end
  #
  # it "is valid with a zip code" do
  #   expect(bar_one.zip).to eq("02111")
  # end
  #
  # it "is not valid without a name" do
  #   bad_bar = Bar.new(name: nil)
  #   expect(bad_bar).to_not be_valid
  # end
  #
  # it "is not valid without an address" do
  #   bad_bar = Bar.new(address: nil)
  #   expect(bad_bar).to_not be_valid
  # end
  #
  # it "is not valid without a city" do
  #   bad_bar = Bar.new(city: nil)
  #   expect(bad_bar).to_not be_valid
  # end
  #
  # it "is not valid without a state" do
  #   bad_bar = Bar.new(state: nil)
  #   expect(bad_bar).to_not be_valid
  # end
  #
  # it "is not valid without a zip code" do
  #   bad_bar = Bar.new(zip: nil)
  #   expect(bad_bar).to_not be_valid
  # end
  # DatabaseCleaner.clean
end
