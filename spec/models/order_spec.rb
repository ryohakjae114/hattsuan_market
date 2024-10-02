require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:user) { create(:user) }
  let!(:order) { build(:order, user:) }

  describe 'validation' do
    example '配達日は配達3営業日から14営業日までの間で指定できる' do
      order.delivery_on = 3.business_day.from_now.to_date - 1
      expect(order).not_to be_valid

      order.delivery_on = 3.business_day.from_now.to_date
      expect(order).to be_valid

      order.delivery_on = 14.business_day.from_now.to_date
      expect(order).to be_valid

      order.delivery_on = 14.business_day.from_now.to_date + 1
      expect(order).not_to be_valid
    end
  end

  describe 'logic' do
    let!(:product) { create(:product) }
    let!(:cart) { create(:cart, user:) }

    example '送料は5つにつき600円かかる' do
      create :cart_item, cart:, product:, quantity: 5
      order.save!
      expect(order.postage).to eq 600
    end

    describe 'delivery_fee' do
      example '商品の合計が0円から10000円未満だと300円の代引き手数料がかかる' do
        product.update!(price_without_tax: (9999 / (110.0 / 100.0)).floor)
        puts product.price_without_tax
        create :cart_item, cart:, product:, quantity: 1
        puts cart.cart_items.first.price_with_tax
        order.save!
        puts order.order_items.first.price_with_tax
        expect(order.delivery_fee).to eq 300
      end
    end
  end
end
