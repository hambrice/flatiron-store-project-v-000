class User < ActiveRecord::Base
  has_many :carts
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def current_cart=(cart)
    if cart != nil
      self.current_cart_id = cart.id
      cart.update(user: self)
    else
      self.current_cart_id = nil
    end
    self.save
  end

  def current_cart
    Cart.find_by(id: self.current_cart_id)
  end

  end
