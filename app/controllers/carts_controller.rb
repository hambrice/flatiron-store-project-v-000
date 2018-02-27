class CartsController < ApplicationController
  def show
    @current_cart = Cart.find_by(id: params[:id])
   # if @current_cart.status == "active"
   #    @current_cart.user.current_cart = @current_cart
   #  end
    #binding.pry
  end

  def checkout
    #binding.pry
    @cart = Cart.find(params[:id])
    @cart.user.current_cart = nil
    #binding.pry
    @cart.checkout
    redirect_to cart_path(@cart)
  end
end
