class Item < ApplicationRecord
  has_one_attached :item_picture
  has_many :categorization, dependent: :destroy
  has_many :categories, through: :categorization
  accepts_nested_attributes_for :categories
  validates :categories, presence: true

  def categories_attributes=(category_attributes)
    category_attributes.each_value do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      categories << category
    end
  end
end
