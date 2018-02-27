class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :status, default: "active"
      t.integer :user_id
    end
  end
end
