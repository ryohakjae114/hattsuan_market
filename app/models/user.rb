class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :name, length: { maximum: 50 }
  validates :address, length: { maximum: 200 }
end
