# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  attr_reader :user, :order

  def initialize(user, order)
    super
    @user = user
    @order = order
  end

  def index?
    user.present? && admin?
  end

  def show?
    user.present? && (admin? || owner?)
  end

  def update?
    user.present? && admin?
  end

  private

  def owner?
    order.user == user
  end

  def admin?
    user.admin?
  end
end
