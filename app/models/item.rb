class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items

  def self.available_items
    array = []
    self.all.each do |item|
      array << item if item.inventory >= 1
    end
    array
    #binding.pry
  end
end
