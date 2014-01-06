class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  # private
  
  #   def current_cart
  #     Cart.find(session[:cart_id])
  #   rescue ActiveRecord::RecordNotFound
  #     cart = Cart.create
  #     session[:cart_id] = cart.id
  #     cart
  #   end
    
    def current_fav
      Fav.find(session[:fav_id])
    rescue ActiveRecord::RecordNotFound
      fav= Fav.create
      session[:fav_id] = fav.id
      fav
    end
    def current_popularty
      Popularty.find(session[:popularty_id])
    rescue ActiveRecord::RecordNotFound
      popularty = Popularty.create
      session[:popularty_id] = popularty.id
      popularty
    end
    
    protected

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: "please login"
      end
    end
    
    protected

      def current_user
        @current_user ||= User.find_by_id(session[:user_id])
      end

      def signed_in?
        !!current_user
      end

      # helper_method :current_user, :signed_in?

      def current_user=(user)
        @current_user = user
        session[:user_id] = user.id
      end
end
