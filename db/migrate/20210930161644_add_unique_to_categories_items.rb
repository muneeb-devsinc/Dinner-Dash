class AddUniqueToCategoriesItems < ActiveRecord::Migration[5.2]
  def change
    add_index :categories_items, %i[category_id item_id], unique: true
  end
end
