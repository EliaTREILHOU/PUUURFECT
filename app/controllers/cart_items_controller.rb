class CartItemsController < ApplicationController
    before_action :authenticate_user!

    def new
      @item = Item.find(params[:id])
    end
  
    def create
      @cart = Cart.where(user_id: current_user.id).last
      @item = Item.find(params[:item_id])
  
      @cart_item = CartItem.new(
        item_id: @item.id,
        cart_id: @cart.id,
        quantity: 1
      )
          @cart_item.save
  
    end
  
    def destroy
      @cart_item = CartItem.find(params[:cart_id])
      if @cart_item.destroy
        flash[:success] = "Cette carte a bien été supprimée"
        redirect_to user_cart_path(Cart.find_by(user_id: current_user.id))
      end
    end

end
