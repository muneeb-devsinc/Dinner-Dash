class ItemPolicy < ApplicationPolicy
  attr_reader :user, :item

  def initialize(user, item)
    super
    @user = user
    @item = item
  end

  def update?
    user.present? && admin?
  end

  def new?
    user.present? && admin?
  end

  def create?
    user.present? && admin?
  end

  def edit?
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
