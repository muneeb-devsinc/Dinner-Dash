class Item < ApplicationRecord
  has_one_attached :item_picture
  has_many :categorization
  has_many :categories, through: :categorization, foreign_key: true
  has_many :order_items
  accepts_nested_attributes_for :categories
  validates :title, presence: { message: 'Item must have a title' }, uniqueness: { message: 'Item name is not unique' }, allow_blank: false
  validates :price, presence: { message: 'Item must have a price' }
  validates :description, presence: {message: 'Item must have a description' }
  validates :categories, presence: { message: 'Item must belong to atleast one Category' }
  validates :item_picture, attached: { message: 'Item must have a picture attached' }, content_type: [:png, :jpg, :jpeg]
end