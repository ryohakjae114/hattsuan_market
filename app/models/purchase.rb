class Purchase < ApplicationRecord
  belongs_to :purchase
  belongs_to :user
end
