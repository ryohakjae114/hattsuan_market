class Order < ApplicationRecord
  extend Enumerize

  AVAILABLE_DELIVERY_TIME_ZONES = %w[08-12 12-14 14-16 16-18 18-20 20-21].freeze
  enumerize :delivery_time_zone, in: AVAILABLE_DELIVERY_TIME_ZONES

  belongs_to :user
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items, allow_destroy: true

  before_create do
    product_tax = PRODUCT_TAX
    user.cart.cart_items.each do |cart_item|
      order_items.build(product_id: cart_item.product_id, quantity: cart_item.quantity, price_with_tax: cart_item.price_with_tax * (1 + product_tax))
    end
    user.cart.destroy!
  end

  validates :delivery_on, presence: true, comparison: { greater_than_or_equal_to: -> { Time.zone.today } }
  validates :delivery_time_zone, presence: true
  validates :delivery_address, presence: true, length: { maximum: 200 }
  validates :addressee_name, presence: true, length: { maximum: 50 }
  validates :product_tax, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :box_tax, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :box_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :available_date_of_delivery

  def self.available_dates_of_delivery
    available_start_date_of_delivery = 3.business_days.from_now.to_date
    available_end_date_of_delivery = 15.business_days.from_now.to_date
    available_start_date_of_delivery.business_dates_until(available_end_date_of_delivery)
  end

  def available_date_of_delivery
    unless Order.available_dates_of_delivery.include?(delivery_on)
      errors.add(:delivery_on, I18n.t('errors.models.order.delivery_on_cant_delivery'))
    end
  end

  def set_box_price
    (order_items.count.to_f / 5).ceil
  end
end
