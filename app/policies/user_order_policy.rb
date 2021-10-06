# frozen_string_literal: true

class UserOrderPolicy < ApplicationPolicy
  attr_reader :user, :order

  def initialize(user, order)
    super
    @user = user
    @user_order = order
  end

  def index?
    user.present?
  end

  def show?
    byebug
    user.present? && (owner? || admin?)
  end

  def update?
    user.present?
  end

  private

  def owner?
    order.user == user
  end

  def admin?
    user.admin?
  end
end
