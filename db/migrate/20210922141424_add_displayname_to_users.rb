# frozen_string_literal: true

class AddDisplaynameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :display, :string, default: 'User'
  end
end
