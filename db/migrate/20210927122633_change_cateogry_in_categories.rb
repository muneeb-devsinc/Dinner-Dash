# frozen_string_literal: true

class ChangeCateogryInCategories < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        add_index :categories, :category, unique: true
      end
      dir.down do
        remove_index :categories, :category
      end
    end
  end
end
