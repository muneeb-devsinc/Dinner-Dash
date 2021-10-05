# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :picture
  has_and_belongs_to_many :categories, dependent: :nullify
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  enum status: { active: 0, retired: 1 }

  accepts_nested_attributes_for :categories

  validates :picture, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :title, presence: true, allow_blank: false
  validates :title, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :description, presence: true, allow_blank: false
  validates :categories, presence: true

  scope :sorted_by_title, -> { order('items.title ASC') }

  before_create :set_default_image

  def set_default_image
    attach_image if picture.attachment.nil?
  end

  def attach_image
    picture.attach(io: File.open(Rails.root.join('app/assets/images/cookie.jpeg').to_s), filename: 'cookie.jpeg', content_type: 'image/jpeg')
  end
end
