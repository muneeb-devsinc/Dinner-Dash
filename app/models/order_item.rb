class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  validates :item_id, uniqueness: { scope: :order_id }

end
