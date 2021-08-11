class UsersController < ApplicationController
  before_action :validate_access, on: %i[index edit update]

  def index
    @users = User.all.order(:email)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      redirect_to dashboard_path, flash: { info: "New role has been assigned to #{user.email}!" }
    else
      redirect_to dashboard_path, flash: { error: 'Role assignment was unsuccessful' }
    end
  end

  private

  def validate_access
    unless Current.user.role == 'admin'
      redirect_to dashboard_path, flash: { warning: 'You are not authorized to access this page.' }
    end
  end

  def user_params
    params.require(:user).permit(:role)
  end
end
