class PurchaseItem < ApplicationRecord
  belongs_to :purchase
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
