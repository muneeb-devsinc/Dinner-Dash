class AddItemToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :category, index: true
  end
end
