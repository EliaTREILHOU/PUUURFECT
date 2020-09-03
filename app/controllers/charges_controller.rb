class ChargesController < ApplicationController
  def new
    @cart = Cart.find(params[:cart_id])
    @cart_item = CartItem.where(cart_id: params[:cart_id])
    @total_price = 0
    @cart_item.each do |element|
      @total_price = element.item.price  + @total_price
    end
  end
  
  def create
    # Amount in cents
    @cart = Cart.find(params[:cart_id])
    @cart_item = CartItem.where(cart_id: params[:cart_id])
    @price_to_pay = 0
    @cart_item.each do |element|
      @price_to_pay = element.item.price  + @price_to_pay
    end
    @amount = @price_to_pay * 100
    
    @current_user = User.find(params[:user_id])
    order = Order.create(user_id: current_user.id)
    @cart_item = CartIem.where(cart_id: params[:cart_id])
    @cart_item.each do |element|
      OrderItem.create(order_id: order.id, item_id: element.item.id, quantity: 1, added_price: element.item.price)
    end

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
  
    Order.find(order.id).update(stripe_customer_id: customer.id)
    redirect_to user_path(@current_user)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
