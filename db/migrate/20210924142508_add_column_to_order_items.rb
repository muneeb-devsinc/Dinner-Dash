class AddColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
    change_column :order_items, :quantity, :integer, default: 1
  end
end
