# frozen_string_literal: true

class AddDefaultOrder < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        change_column :orders, :total, :decimal, default: 0
      end
      dir.down do
        change_column :orders, :total, :decimal
      end
    end
  end
end
