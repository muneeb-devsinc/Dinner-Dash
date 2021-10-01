# frozen_string_literal: true

class Category < ApplicationRecord
  has_and_belongs_to_many :items, dependent: :nullify
  validates :category, presence: { message: 'Category cant be empty' }, allow_blank: false
  validates :category, uniqueness: { case_sensitive: false, message: 'Category name is not unique' }
end
