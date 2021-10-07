# frozen_string_literal: true

class UserOrderPolicy < ApplicationPolicy
  attr_reader :user, :order

  def index?
    user.present?
  end

  def show?
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
