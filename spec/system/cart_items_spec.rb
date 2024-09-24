require 'rails_helper'

RSpec.describe 'CartItems', type: :system do
  context 'ログイン時' do
    let!(:hakjae) { create(:user, email: 'hattsuan@example.com') }
    let!(:hakjae_cart) { create(:cart, user: hakjae) }
    let!(:nerune) { create :product, name: 'ねるねるねーるね', price_without_tax: 100 }
    let!(:poteti) { create :product, name: 'ポテチ', price_without_tax: 200 }
    let!(:cart_item) { create(:cart_item, cart: hakjae_cart, product_id: poteti.id, quantity: 5) }

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
      visit product_path(poteti)
      expect(page).to have_field '個数', with: 5
      fill_in '個数', with: 5
      click_on '数量を変更'
      expect(page).to have_content '更新しました'
      visit cart_path
      within ".cart_item_#{cart_item.id}" do
        expect(page).to have_content 'ポテチ'
        expect(page).to have_content '5'
      end
    end

    it 'カートに入った商品を削除できる' do
      create(:cart_item, cart: hakjae_cart, product_id: nerune.id, quantity: 1)
      visit cart_path
      within '.ねるねるねーるね' do
        click_on '削除'
      end
      expect(page).to have_content('削除しました')
      expect(page).not_to have_content('.ねるねるねーるね')
    end
  end
end
