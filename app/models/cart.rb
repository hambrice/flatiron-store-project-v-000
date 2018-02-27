class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
      #binding.pry
    end
    total
  end

  def add_item(id)
    line_item = self.line_items.find_by(item_id: id)
    if line_item
      line_item.quantity += 1
      line_item.save
      #binding.pry
    else
      line_item = self.line_items.build(item_id: id)
    end
    line_item
  end

  def checkout
    self.line_items.each do |line_item|
      line_item.item.inventory -=line_item.quantity
      line_item.item.save
    end
    #binding.pry
    self.update(status: "submitted")
    self.user.current_cart = nil
    self.user.save
  end

end
