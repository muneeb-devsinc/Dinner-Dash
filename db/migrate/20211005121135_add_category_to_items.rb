class AddCategoryToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :item, index: true
  end
end
