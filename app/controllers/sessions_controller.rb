class SessionsController < ApplicationController
  skip_before_action :set_current_user

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end
end
