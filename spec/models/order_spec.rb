require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validation' do
    let!(:user) { create(:user) }
    let!(:order) { build(:order, user:) }

    example '配達日は配達3営業日から15営業日までの間で指定できる' do
      order.delivery_on = 2.business_day.from_now
      expect(order).not_to be_valid

      order.delivery_on = 10.business_day.from_now
      expect(order).to be_valid

      order.delivery_on = 16.business_day.from_now
      expect(order).not_to be_valid
    end
  end
end
