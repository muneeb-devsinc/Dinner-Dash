# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :set_user, only: :update
  def index
    @users = User.members_only.order(:id)
    authorize @users, policy_class: AdminPolicy
  end

  def update
    authorize @user, policy_class: AdminPolicy
    @user.role = user_params[:role]
    if @user.save(validate: false)
      flash[:notice] = 'User Successfully Updated'
    else
      flash[:Alert] = 'User Update Unsuccessful'
    end
    redirect_to admin_index_path
  end

  private

  def user_params
    params.permit(:id, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
