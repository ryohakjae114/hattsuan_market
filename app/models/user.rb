class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
end
