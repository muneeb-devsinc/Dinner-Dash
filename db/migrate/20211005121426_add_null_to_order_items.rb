# frozen_string_literal: true

class AddNullToOrderItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :order_items, :unit_price, false
    change_column_null :order_items, :item_title, false
  end
end
