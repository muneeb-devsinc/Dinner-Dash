class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items, dependent: :destroy
  belongs_to :user
  scope :all_orders, -> { where.not(status: :inprogress) }
  scope :order_order, -> { order('orders.id ASC') }
  scope :show_by_status, ->(status) { where(status: status) }
  enum status: { inprogress: 0, ordered: 1, paid: 2, cancelled: 3, completed: 4 }
end
