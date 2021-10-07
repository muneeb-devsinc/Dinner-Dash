# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  belongs_to :user

  enum status: { in_progress: 0, order_placed: 1, paid: 2, cancelled: 3, completed: 4 }

  validates :status, :total, :user_id, presence: true

  scope :not_in_progress, -> { where.not(status: :in_progress) }
  scope :show_by_status, ->(status) { where(status: status) }
end
