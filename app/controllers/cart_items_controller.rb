class CartItemsController < ApplicationController

    def new
        @item = Item.find(params[:id])
    end

    def create
        @cart = Cart.where(user_id: current_user.id).last
        @item = Item.find(params[:item_id])
    
        @cart_item = CartItem.new(
          item_id: @item.id,
          cart_id: @cart.id,
          total_price: @item.price,
          quantity: 1
        )
        if @cart_item.save
          flash[:success] = "La carte de #{@item.title} a bien été ajoutée à ton panier ! "
        else 
          flash[:error] = "Nous n'avons pas pu ajouter cette carte à ton panier."
        end
    end





end
