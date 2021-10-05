# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :nullify

  enum role: { member: 0, admin: 1 }

  validates :display_name, length: { minimum: 2, maximum: 32 }, allow_blank: true

  scope :members_only, -> { where.not(name: nil) }
end
