class LineItemsController < ApplicationController
  def create
    #binding.pry
    #item = Item.find(params[:id])
    if current_user.current_cart == nil
      current_user.current_cart = Cart.create
      #binding.pry
      line_item = current_user.current_cart.add_item(params[:item_id])
    else
      line_item = current_user.current_cart.add_item(params[:item_id])
    end
    if line_item.save
    #binding.pry
      redirect_to cart_path(current_user.current_cart)
    else
      redirect_to store_path
    end
  end
end
