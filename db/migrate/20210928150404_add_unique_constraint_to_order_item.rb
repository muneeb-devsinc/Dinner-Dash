# frozen_string_literal: true

class AddUniqueConstraintToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_index :order_items, %i[order_id item_id], unique: true
  end
end
