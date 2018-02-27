class StoreController < ApplicationController
  def index
    #binding.pry
    @categories = Category.all
    #binding.pry
    @items = Item.available_items
    @user = current_user
  end

  # <% if @user.current_cart != nil %>
  # <%= link_to "Current Cart", cart_path(@user.current_cart) %>
  # <% end %>
end
