# frozen_string_literal: true

class AddItemToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :category, index: true, foreign_key: true
  end
end
