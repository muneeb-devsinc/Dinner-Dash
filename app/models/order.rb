class Order < ApplicationRecord
  has_many :items, through: order_items, dependent: :destroy
  belongs_to :user
end
