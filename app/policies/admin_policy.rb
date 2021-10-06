# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  attr_reader :user, :admin

  def initialize(user, admin)
    super
    @user = user
    @admin = admin
  end

  def index?
    admin?
  end

  def update?
    admin?
  end

  private

  def admin?
    user.present? && user.admin?
  end
end
