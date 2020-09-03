class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource_or_scope)
      session[:user_id] = current_user.id
      @cart = Cart.new(user_id: current_user.id)
      if @cart.save
        root_path
      end
    end
    
    def pricetopay
      @cart = Cart.find(params[:id])
  
      @cart_items = CartItem.where(cart_id: params[:id])
      
      @total_price = 0
      @cart_items.each do |element|
        @total_price = element.item.price  + @total_price
      end
    end
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
    end

end
