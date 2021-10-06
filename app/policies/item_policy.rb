# frozen_string_literal: true

class ItemPolicy < ApplicationPolicy
  attr_reader :user, :item

  def initialize(user, item)
    super
    @user = user
    @item = item
  end

  def update?
    admin?
  end

  def new?
    admin?
  end

  def create?
    admin?
  end

  def edit?
    admin?
  end

  def destroy?
    admin?
  end

  private

  def admin?
    user.present? && user.admin?
  end
end
