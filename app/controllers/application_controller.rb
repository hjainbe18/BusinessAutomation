class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    else
      redirect_to sign_in_path, flash: {warning: 'You are not authenticated to access this page. Please sign in.'}
    end
  end
end
