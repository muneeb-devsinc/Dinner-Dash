class CreateCategorizations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :items do |t|
      t.index :category_id
      t.index :item_id

      t.timestamps
    end
  end
end
