class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])

    @cart_items = CartItem.where(cart_id: params[:id])
    
    @total_price = 0
    @cart_item.each do |cartitem|
      @total_price = cartitem.item.price + @total_price

  end
  
end


