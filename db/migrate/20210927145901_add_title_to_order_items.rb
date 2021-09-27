class AddTitleToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :item_title, :string
  end
end
