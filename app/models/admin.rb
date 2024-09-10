class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
end
