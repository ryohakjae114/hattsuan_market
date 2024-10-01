require 'rails_helper'

RSpec.describe 'Orders', type: :system do
  context 'ログイン時' do
    let!(:hakjae) { create(:user, email: 'hattsuan@example.com') }
    let!(:nerune) { create :product, name: 'ねるねるねーるね', price_without_tax: 100 }
    let!(:pie) { create :product, name: 'パイ', price_without_tax: 200 }
    let!(:hakjae_cart) { create(:cart, user: hakjae) }
    let(:nerune_order) { create :cart_item, cart: hakjae_cart, product_id: nerune.id, quantity: 2 }
    let(:pie_order) { create :cart_item, cart: hakjae_cart, product_id: pie.id, quantity: 1 }
    let(:hakjae_order) { create :order, user: hakjae }
    let!(:three_business_day_from_now) { 3.business_day.from_now }

    before do
      sign_in hakjae
    end

    it '注文できる' do
      visit orders_path
      expect(page).to have_content('なし')
      visit cart_path
      expect(page).to have_css '.table'
      click_on '注文する'
      expect do
        select three_business_day_from_now.year, from: 'order[delivery_on(1i)]'
        select three_business_day_from_now.month, from: 'order[delivery_on(2i)]'
        select three_business_day_from_now.day, from: 'order[delivery_on(3i)]'
        fill_in 'お届け先', with: '神奈川県川崎市中原区下小田中3'
        fill_in '宛名', with: '呂鶴載'
        click_on '注文する'
      end.to change { hakjae.orders.count }.by(1)
      expect(page).to have_content '注文しました'
      visit cart_path
      expect(page).not_to have_css '.table'
      visit orders_path
      expect(page).not_to have_content('なし')
    end

    it '注文詳細ページを閲覧できる' do
      create :order, user: hakjae
      visit orders_path
      within '.table' do
        find('a').click
      end
      expect(page).to have_content('注文詳細')
      expect(page).to have_content('ねるね')
      expect(page).to have_content('パイ')
    end
  end
end
