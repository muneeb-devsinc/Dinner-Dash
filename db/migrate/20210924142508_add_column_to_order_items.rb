# frozen_string_literal: true

class AddColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        change_column :order_items, :quantity, :integer, default: 1
      end
      dir.down do
        change_column :order_items, :quantity, :integer
      end
    end
  end
end
