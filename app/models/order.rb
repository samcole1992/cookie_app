class Order < ApplicationRecord

  belongs_to :consumer, class_name: "User", foreign_key: "consumer_id"

  belongs_to :provider, class_name: "User", foreign_key: "provider_id", optional: true


end
