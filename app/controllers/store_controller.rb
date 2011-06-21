class StoreController < ApplicationController
  skip_before_filter :authorize
  def index	
	if params[:set_locale]
		redirect_to store_path(:locale => params[:set_locale])
	else
		@products = Product.all
		@count = increment_count
		@cart = current_cart
	end
  end
  
  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end

end
