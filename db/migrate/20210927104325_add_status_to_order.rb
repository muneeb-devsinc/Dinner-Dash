# frozen_string_literal: true

class AddStatusToOrder < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        change_column :orders, :status, :integer, default: 0
      end
      dir.down do
        change_column :orders, :status, :integer
      end
    end
  end
end
