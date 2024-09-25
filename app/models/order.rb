class Order < ApplicationRecord
  extend Enumerize

  AVAILABLE_DELIVERY_TIME_ZONES = %w[08-12 12-14 14-16 16-18 18-20 20-21].freeze
  enumerize :delivery_time_zone, in: AVAILABLE_DELIVERY_TIME_ZONES

  belongs_to :user

  before_create do
    user.cart.destroy!
  end

  validates :delivery_on, presence: true, comparison: { greater_than_or_equal_to: -> { Time.zone.today } }
  validates :delivery_time_zone, presence: true
  validates :delivery_address, presence: true, length: { maximum: 200 }
  validates :addressee_name, presence: true, length: { maximum: 50 }
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
end
