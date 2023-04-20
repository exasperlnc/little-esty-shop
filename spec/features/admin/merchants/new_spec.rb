require 'rails_helper'

RSpec.describe "admin/merchant#new" do
  
  it 'fails to send incomplete form' do
    visit new_admin_merchant_path
    
    click_button "Create Merchant"

    expect(page).to have_content("Creation Failure")
    expect(current_path).to eq(new_admin_merchant_path)
  end

  it 'completes form and reroutes' do
    visit new_admin_merchant_path

    fill_in "Name", with: "Alec"

    expect(page).to have_content("Creation Successful")
    expect(current_path).to eq(admin_merchants_path)
  end
end