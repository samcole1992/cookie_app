class Order < ApplicationRecord

  has_one :charge

  validates :cookie_type, presence: true
  validates :cookie_amount, presence: true
  belongs_to :consumer, class_name: "User", foreign_key: "consumer_id"
  belongs_to :provider, class_name: "User", foreign_key: "provider_id", optional: true

end
