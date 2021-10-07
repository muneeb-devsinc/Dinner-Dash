# frozen_string_literal: true

class AddNullToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :title, false
    change_column_null :items, :description, false
    change_column_null :items, :price, false
  end
end
