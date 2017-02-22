require "rails_helper"


user_one = User.create(first_name: "Sam", last_name: "Cole", street: "1 Here St.", state: "MA", city: "Boston",email: "sam@gmail.com", encrypted_password: "ththth")
order_one = Order.create(cookie_type: "Oatmeal", cookie_amount: "123")

RSpec.describe User, :type => :model do

  it "is valid with a first name" do
    expect(user_one.first_name).to eq("Sam")
  end

  it "is valid with a street" do
    expect(user_one.address).to eq("1 Here St.")
  end

  it "is valid with a city" do
    expect(user_one.city).to eq("Boston")
  end

  it "is valid with a state" do
    expect(uesr_one.state).to eq("MA")
  end

  it "is not valid without a name" do
    bad_user = User.new(name: nil)
    expect(bad_user).to_not be_valid
  end

  it "is not valid without an street" do
    bad_user = User.new(street: nil)
    expect(bad_user).to_not be_valid
  end

  it "is not valid without a city" do
    bad_user = User.new(city: nil)
    expect(bad_user).to_not be_valid
  end

  it "is not valid without a state" do
    bad_user = User.new(state: nil)
    expect(bad_user).to_not be_valid
  end
  
end
