class OrderItem < ApplicationRecord
  belong_to :order
  belongs_to :item
end
