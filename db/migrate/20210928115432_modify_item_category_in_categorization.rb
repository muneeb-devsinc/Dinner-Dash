class ModifyItemCategoryInCategorization < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        remove_index :categorizations, :category_id
        remove_index :categorizations, :item_id
        remove_column :categorizations, :category_id
        remove_column :categorizations, :item_id
        add_reference :categorizations, :item, foreign_key: true
        add_reference :categorizations, :category, foreign_key: true
        # add_index %i[item_id category_id], unique: true
      end
      dir.down do
        # remove_index %i[item_id category_id], unique: true
        remove_reference :categorizations, :category, foreign_key: true
        remove_reference :categorizations, :item, foreign_key: true
        change_table :categorizations do |t|
          t.belongs_to :item, index: true
          t.belongs_to :category, index: true
        end
      end
    end
  end
end
