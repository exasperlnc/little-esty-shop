require 'rails_helper'

RSpec.describe 'Merchant Dashboard Page' do

  before :each do
    test_data
    @transaction_11 = Transaction.create!(credit_card_number: "1234567890123456", credit_card_expiration_date: "2025-01-01", result: 1, invoice: @invoice_1)
    @transaction_12 = Transaction.create!(credit_card_number: "1234146541543155", credit_card_expiration_date: "2025-01-11", result: 1, invoice: @invoice_1)
    @transaction_13 = Transaction.create!(credit_card_number: "1234567890123456", credit_card_expiration_date: "2025-01-01", result: 1, invoice: @invoice_2)
  end
  describe 'As a merchant, when I visit my merchant dashboard page' do
    it 'I see the name of the merchant' do
      visit merchant_dashboard_path(@merchant_1)

      expect(page).to have_content(@merchant_1.name)
    end

    it 'I see Links to my merchant items index and merchant invoices index' do
      visit merchant_dashboard_path(@merchant_1)

      expect(page).to have_link('My Items')
      expect(page).to have_link('My Invoices')
    end

    it 'I see the name of the top 5 customers who have conducted the largest number of successful transactions with my merchant' do
      visit merchant_dashboard_path(@merchant_1)
      
      expect(page).to have_content(@customer_1.first_name)
      expect(page).to have_content(@customer_2.first_name)
      expect(page).to have_content(@customer_4.first_name)
    end

    it 'I see the number of successful transactions next to each customer name' do
      visit merchant_dashboard_path(@merchant_1)

      expect(page).to have_content("Number of Transactions: 3")
      expect(page).to have_content("Number of Transactions: 2")
      expect(page).to have_content("Number of Transactions: 1")
    end
  end
end