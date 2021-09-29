class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  validates :item_id, uniqueness: { scope: :order_id }
  scope :cart_order, -> { order('order_items.item_id ASC') }
  # attr_accessor :quantity, :total, :unit_price

  # def self.total
  #   self.total = self.quantity * self.unit_price
  # end
end
