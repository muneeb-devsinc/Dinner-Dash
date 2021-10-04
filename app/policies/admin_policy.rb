# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  attr_reader :user, :admin

  def initialize(user, admin)
    super
    @user = user
    @admin = admin
  end

  def index?
    user.present? && admin?
  end

  def update?
    user.present? && admin?
  end

  private

  def admin?
    user.admin?
  end
end
