# frozen_string_literal: true

class CategoryPolicy < ApplicationPolicy
  attr_reader :user, :category

  def initialize(user, category)
    super
    @user = user
    @category = category
  end

  def new?
    user.present? && admin?
  end

  def create?
    user.present? && admin?
  end

  def destroy?
    user.present? && admin?
  end

  private

  def admin?
    user.admin?
  end
end
