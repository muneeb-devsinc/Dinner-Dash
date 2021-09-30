class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :nullify
  validates :display, length: { minimum: 2, maximum: 32 }, allow_blank: true
  scope :asc, -> { order('id ASC') }
  enum role: { member: 0, admin: 1 }
  scope :admin, -> { where(role: :admin) }
end
