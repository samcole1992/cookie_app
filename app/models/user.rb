class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews
  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true

  has_many :consumers, class_name: "User", foreign_key: "consumer_id", through: :orders
  has_many :providers, class_name: "User", foreign_key: "provider_id", through: :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
