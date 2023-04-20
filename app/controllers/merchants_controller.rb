class MerchantsController < ApplicationController
  def dashboard
    @image_search = ImageSearch.new
    @logo = @image_search.images("Big Pharma")
    @merchant = Merchant.find(params[:id])
    @top_five_customers = @merchant.customers.top_five_customers
    @items_ready_to_ship = @merchant.items_ready_to_ship
    @images = @image_search.images(@merchant.name)
  end
end