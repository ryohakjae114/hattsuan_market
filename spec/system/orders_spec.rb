require 'rails_helper'

RSpec.describe 'Carts', type: :system do
  context 'ログイン時' do
    let!(:hakjae) { create(:user, email: 'hattsuan@example.com', password: '123456123456', password_confirmation: '123456123456') }
    let!(:nerune) { create :product, name: 'ねるねるねーるね', price_without_tax: 100 }

    before do
      sign_in hakjae
    end

    it '商品をカートに追加できる' do
      visit product_path(nerune)
      fill_in '個数',	with: 2
      click_on 'カートに追加'
      expect(page).to have_content '新規登録しました'
      visit cart_items_path
      expect(page).to have_content 'ねるねるねーるね'
      expect(page).to have_content '220円'
    end
  end
end
