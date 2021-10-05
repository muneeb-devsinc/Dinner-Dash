# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item_id, uniqueness: { scope: :order_id }

  scope :cart_order, -> { order('order_items.item_id ASC') }
end
