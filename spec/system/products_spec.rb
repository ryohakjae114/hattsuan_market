require 'rails_helper'

RSpec.describe 'Products', type: :system do
  it '商品を一覧できること' do
    create :product, name: 'ねるねるねーるね', price_without_tax: 100
    create :product, name: 'ポテチ', price_without_tax: 500
    create :product, name: 'ナナチキ', price_without_tax: 200

    visit root_path
    expect(page).to have_content('商品一覧')
    expect(page).to have_content('ねるねるねーるね')
    expect(page).to have_content('100円')
    expect(page).to have_content('ポテチ')
    expect(page).to have_content('500円')
    expect(page).to have_content('ナナチキ')
    expect(page).to have_content('200円')
  end
end
