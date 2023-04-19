class MerchantsController < ApplicationController
  def dashboard
    @merchant = Merchant.find(params[:id])
    @top_five_customers = @merchant.customers.top_five_customers
    @items_ready_to_ship = @merchant.items_ready_to_ship
  end
end