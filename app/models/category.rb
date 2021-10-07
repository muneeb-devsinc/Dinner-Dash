# frozen_string_literal: true

class Category < ApplicationRecord
  has_and_belongs_to_many :items, dependent: :nullify

  validates :category, presence: true
  validates :category, uniqueness: { case_sensitive: false }
end
