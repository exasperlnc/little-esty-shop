require 'rails_helper'

RSpec.describe 'Admin Merchants Show Page' do
  before :each do
    test_data
  end

  describe "As an admin, when I visit the merchant edit page" do
    it 'has a form filled with merchants current info' do
      visit "admin/#{@merchant_1.id}/edit"

      expect(find_field('Name').value).to eq(@merchant_1.name)
      
      visit edit_admin_merchant_path(@merchant_2)

      expect(find_field('Name').value).to eq(@merchant_2.name)
    end

    xit 'submits new data' do
      visit "admin/#{@merchant_1.id}/edit"
      
      fill_in('Name'), with: 'New Merchant Name'
      click_button('Update')

      expect(current_path).to eq("admin/merchants/#{@merchant_1.id}")
      expect(page).to have_content('New Merchant Name')

      visit edit_admin_merchant_path(@merchant_2)

      
      fill_in('Name'), with: 'New Merchant Name'
      click_button('Update')

      expect(current_path).to eq(admin_merchant(@merchant_2)
      expect(page).to have_content('New Merchant Name')
    end
  end