# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :item, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.decimal :total, default: 0
      t.decimal :unit_price

      t.timestamps
    end
  end
end
