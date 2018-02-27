class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
  has_one :category, through: :item
  
end
