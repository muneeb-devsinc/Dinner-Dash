class Category < ApplicationRecord
  has_many :categorization
  has_many :items, through: :categorization, dependent: :destroy
end
