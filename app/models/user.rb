class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
end
