require 'rails_helper'

RSpec.describe 'PaymentInformations', type: :system do
  context 'ログイン時' do
    let!(:user) { create(:user, email: 'hattsuan@example.com') }

    before do
      sign_in user
    end

    it 'お支払い情報を変更できる' do
      visit root_path
      click_on 'お支払い情報変更'
      fill_in '名前', with: 'はっちゃん'
      fill_in '住所', with: '広島県西区福島町2-8-1'
      click_on '更新する'
      expect(page).to have_content '更新しました'
      visit edit_payment_informations_path
      expect(page).to have_field '名前', with: 'はっちゃん'
      expect(page).to have_field '住所', with: '広島県西区福島町2-8-1'
    end
  end
end
