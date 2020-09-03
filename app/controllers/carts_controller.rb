class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_your_cart, only: [:show]

  def show
    @cart = Cart.find(params[:id])

    @cart_items = CartItem.where(cart_id: params[:id])
    
    @total_price = 0
    @cart_items.each do |element|
      @total_price = element.item.price  + @total_price
    end
  end

  def is_your_cart
    if Cart.find(params[:id]).user_id != current_user.id
      flash[:error] = "Hmmm, ce n'est pas ton panier...."
      redirect_to root_path
    end
  end
  
end


