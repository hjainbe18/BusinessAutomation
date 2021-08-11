class RegistrationsController < ApplicationController
  skip_before_action :set_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    all_params = params.require(:user).deep_dup
    case all_params[:role]
    when 'supervisor'
      all_params.permit(:email, :password, :password_confirmation, :role,
                        supervisor_attributes: %i[name])
    when 'customer'
      all_params.permit(:email, :password, :password_confirmation, :role,
                        customer_attributes: %i[name address contact_number])
    else
      all_params.reject { |key| %w[customer_attributes supervisor_attributes].include?(key) }
                .permit(:email, :password, :password_confirmation, :role)
    end
  end
end
