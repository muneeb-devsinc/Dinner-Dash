# frozen_string_literal: true

class RemoveDefaultFromUserDisplay < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :display_name, from: 'User', to: nil)
  end
end
