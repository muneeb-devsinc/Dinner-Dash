class AdminController < ApplicationController
  def index
    @users = User.all.asc
    authorize @users, policy_class: AdminPolicy
  end

  def update
    @user = User.find(params[:id])
    authorize @user, policy_class: AdminPolicy
    @user.update(user_params)

    redirect_to admin_index_path
  end

  private

  def user_params
    params.permit(:id, :role)
  end
end
