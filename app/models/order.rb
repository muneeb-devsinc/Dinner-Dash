class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items, dependent: :destroy
  belongs_to :user
  scope :all_orders, -> { where.not(status: :inprogress) }
  scope :paid, -> { where(status: :paid) }
  scope :completed, -> { where(status: :completed) }
  scope :cancelled, -> { where(status: :paid) }
  scope :ordered, -> { where(status: :ordered) }
  scope :order_order, -> { order('orders.id ASC') }
  enum status: { inprogress: 0,ordered: 1, paid: 2, cancelled: 3, completed: 4 }
end
