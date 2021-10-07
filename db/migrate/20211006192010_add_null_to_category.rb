# frozen_string_literal: true

class AddNullToCategory < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categories, :category, false
  end
end
