class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_one :order, dependent: :destroy
end
