# frozen_string_literal: true

class AddCategoryToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :item, index: true, foreign_key: true
  end
end
