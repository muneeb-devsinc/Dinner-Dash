class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items, dependent: :destroy
  belongs_to :user
  enum status: { inprogress: 0, paid: 1, cancelled: 2, compeleted: 3 }
end
