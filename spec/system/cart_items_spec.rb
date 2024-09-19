require 'rails_helper'

RSpec.describe 'CartItems', type: :system do
  context 'ログイン時' do
    let!(:hakjae) { create(:user, email: 'hattsuan@example.com') }
    let!(:hakjae_cart) { create(:cart, user: hakjae) }
    let!(:nerune) { create :product, name: 'ねるねるねーるね', price_without_tax: 100 }

    before do
      sign_in hakjae
    end

    it '商品をカートに追加できる' do
      visit product_path(nerune)
      fill_in '個数', with: 2
      click_on 'カートに追加'
      expect(page).to have_content '新規登録しました'
      visit cart_path
      expect(page).to have_content 'ねるねるねーるね'
      expect(page).to have_content '220円'
    end

    it 'カートに入った商品の個数を変更できる' do
      create(:cart_item, cart: hakjae_cart, product_id: nerune.id, quantity: 5)
      visit product_path(nerune)
      expect(page).to have_field '個数', with: 5
      fill_in '個数', with: 10
      click_on '数量を変更'
      expect(page).to have_content '更新しました'
      visit cart_path
      within '.ねるねるねーるね' do
        expect(page).to have_content '10'
      end
    end
  end
end
