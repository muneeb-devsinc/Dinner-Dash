# frozen_string_literal: true

class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :display, :display_name
  end
end
