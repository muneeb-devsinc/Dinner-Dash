class OrderItem < ApplicationRecord
  belong_to :order
  belongs_to :item

  def create

  end

  private
  def vur
  end
end
