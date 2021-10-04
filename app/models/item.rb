# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :item_picture
  has_and_belongs_to_many :categories
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  accepts_nested_attributes_for :categories
  validates :title, presence: { message: 'Item must have a title' }, allow_blank: false
  validates :title, uniqueness: { case_sensitive: false, message: 'Item name is not unique' }
  validates :price, presence: { message: 'Item must have a price' }, numericality: { greater_than: 0, message: 'Price should be greater than 0' }
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: 'Price not valid i.e 2.99' }
  validates :description, presence: { message: 'Item must have a description' }, allow_blank: false
  before_create :set_default_image
  scope :active, -> { where(status: :active) }
  scope :index_order, -> { order('items.title ASC')}
  # validates :categories, presence: { message: 'Item must belong to atleast one Category' }
  enum status: { active: 0, retired: 1 }

  def set_default_image
    attach_image if item_picture.attachment.nil?
  end

  def attach_image
    item_picture.attach(io: File.open(Rails.root.join('app/assets/images/cookie.jpeg').to_s), filename: 'cookie.jpeg', content_type: 'image/jpeg')
  end
end
