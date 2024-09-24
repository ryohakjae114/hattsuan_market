class Order < ApplicationRecord
  extend Enumerize

  AVAILABLE_DELIVERY_TIME_ZONES = %w[08-12 12-14 14-16 16-18 18-20 20-21]
  enumerize :delivery_time_zone, in: AVAILABLE_DELIVERY_TIME_ZONES

  belongs_to :user

  validates :delivery_on, presence: true, comparison: { greater_than: -> { Time.zone.today } }
  validates :delivery_time_zone, presence: true
  validates :delivery_address, presence: true, length: { maximum: 200 }
  validates :addressee_name, presence: true, length: { maximum: 50 }
end
