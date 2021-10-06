# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    @users = User.members_only.order(:id)
    authorize @users, policy_class: AdminPolicy
  end

  def update
    @user = User.find(params[:id])
    authorize @user, policy_class: AdminPolicy

    if @user.update!(user_params)
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
end
