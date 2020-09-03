class CartItemsController < ApplicationController
    before_action :authenticate_user!
    attr_accessor :item, :cart

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
          flash[:success] = "La photo de #{@item.title} a bien été ajoutée à ton panier !"
          redirect_to root_path
  
    end
  
    def edit
      @cart_item = CartItem.find(params[:id])
    end
  
    def update
      @cart_item = CartItem.find(params[:id])
      if @cart_item.update(event_params)
        flash.now[:success] = "Finalement, tu as #{@cart_item.quantity} photos de #{@cart_item.title} !"
        redirect_to :controller => 'carts', :action => 'show', id: @cart.id
      else
        flash[:danger] = "Nous n'avons pas réussi à modifier l'event"
        redirect_to :controller => 'carts', :action => 'show', id: @cart.id
      end
    end


    def destroy
      @byecart_item = CartItem.find(params[:cart_id])
      if @byecart_item.destroy
        flash[:success] = "Cette carte a bien été supprimée"
        redirect_to cart_path(Cart.find_by(user_id: current_user.id))

      end
    end


end