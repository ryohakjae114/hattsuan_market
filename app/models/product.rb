class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :price_without_tax, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 200 }

  def price_with_tax
    (self.price_without_tax * (1 + TAX)).floor
  end
end
