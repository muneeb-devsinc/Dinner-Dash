# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item_id, uniqueness: { scope: :order_id }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  validates :unit_price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :item_title, presence: true

  scope :cart_order, -> { order('order_items.item_id ASC') }
end
