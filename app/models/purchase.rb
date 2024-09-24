class Purchase < ApplicationRecord
  extend Enumerize

  enumerize :delivery_time_zone, in: %w[8-12 12-14 14-16 16-18 18-20 20-21]

  belongs_to :purchase
  belongs_to :user

  validates :delivery_on, presence: true, date: true
  validates :delivery_time_zone, presence: true
  validates :delivery_address, presence: true, length: { maximum: 200 }
  validates :addressee_name, presence: true, length: { maximum: 50 }
end
