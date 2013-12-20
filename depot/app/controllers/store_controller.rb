class StoreController < ApplicationController
  
  def index
    @products = Product.find_products_for_sale
  end
  
  def find_cart
  	unless session[:cart]
  		session[:cart] = Cart.new  		
  	end
  	session[:cart]
  end

  # def add_to_cart
  # 	begin
  # 		product = Product.find(params[:id])
  # 	rescue ActiveReord :: RecordNotFound
  # 		logger.errors("Attempt to access invalid product")
  # 		flash[:notice] = "Invalid Product"	
  # 		redirect_to :action => :index
  # 	else
  # 		@cart = find_cart
  # 		@cart.add_product(product)
  # end
end
