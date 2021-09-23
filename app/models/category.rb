class Category < ApplicationRecord
  has_many :categorization, dependent: :destroy
  has_many :items, through: :categorization

end
