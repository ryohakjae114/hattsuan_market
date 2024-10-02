class Order < ApplicationRecord
  extend Enumerize

  AVAILABLE_DELIVERY_TIME_ZONES = %w[08-12 12-14 14-16 16-18 18-20 20-21].freeze
  enumerize :delivery_time_zone, in: AVAILABLE_DELIVERY_TIME_ZONES

  belongs_to :user
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items, allow_destroy: true

  before_create do
    self.product_tax = TAX
    set_order_items
    user.cart.destroy!
  end

  after_create do
    update_postage_and_delivery_fee
  end

  validates :delivery_on, presence: true, comparison: { greater_than_or_equal_to: -> { Time.zone.today } }
  validates :delivery_time_zone, presence: true
  validates :delivery_address, presence: true, length: { maximum: 200 }
  validates :addressee_name, presence: true, length: { maximum: 50 }
  validates :product_tax, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :postage, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :delivery_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :available_date_of_delivery

  def available_date_of_delivery
    unless delivery_on.between?(3.business_days.from_now.to_date, 14.business_days.from_now.to_date)
      errors.add(:delivery_on, I18n.t('errors.models.order.delivery_on_cant_delivery'))
    end
  end

  def set_order_items
    user.cart.cart_items.each do |cart_item|
      order_items.build(product_id: cart_item.product_id, quantity: cart_item.quantity, price_with_tax: cart_item.price_with_tax)
    end
  end

  def update_postage_and_delivery_fee
    postage = 600 * (order_items.pluck(:quantity).sum.to_f / 5).ceil
    delivery_fee = case total_items_price_with_tax
                   when 0...10000
                     300
                   when 10000...30000
                     400
                   when 30000...100000
                     600
                   else
                     1000
                   end
    update(postage:, delivery_fee:)
  end

  def total_items_price_with_tax
    order_items.pluck(:price_with_tax).sum
  end
end
