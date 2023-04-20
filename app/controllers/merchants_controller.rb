class MerchantsController < ApplicationController
  def dashboard
    @image_search = ImageSearch.new
    @logo = @image_search.images("Big Pharma")
    @merchant = Merchant.find(params[:id])
    @images = @image_search.images(@merchant.name)
  end

  def create
    @image_search = ImageSearch.new
    @logo = @image_search.images("Big Pharma")
    require 'pry'; binding.pry
    merchant = Merchant.new(merchant_params)
    save_or_error(merchant)
  end
  
  def save_or_error(merch)
    if merch.save
      flash[:success] = "Creation Successful"
      redirect_to admin_merchants_path      
    else
      flash[:notice] = "Creation Failure"
      render :new
    end
  end

  def new
    @image_search = ImageSearch.new
    @logo = @image_search.images("Big Pharma")
  end
  
end