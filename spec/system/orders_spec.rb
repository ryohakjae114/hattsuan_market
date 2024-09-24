require 'rails_helper'

RSpec.describe 'Orders', type: :system do
  context 'ログイン時' do
    let!(:hakjae) { create(:user, email: 'hattsuan@example.com') }
    let!(:nerune) { create :product, name: 'ねるねるねーるね', price_without_tax: 100 }
    let!(:hakjae_cart) { create(:cart, user: hakjae) }

    before do
      sign_in hakjae
    end

    it '注文できる' do
      create :cart_item, cart: hakjae_cart, product_id: nerune.id, quantity: 2
      visit orders_path
      expect(page).to have_content('なし')
      visit cart_path
      expect(page).to have_css '.table'
      click_on '注文する'
      expect do
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
  end
end
