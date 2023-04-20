class ApplicationController < ActionController::Base
 
  before_action :set_image_search
  
  def set_image_search
    @image_search = ImageSearch.new
    @logo = @image_search.images("Big Pharma")
  end
end
