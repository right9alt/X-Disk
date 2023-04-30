class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :is_auth?

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_auth?
    redirect_to storage_path, notice: 'Вы уже вошли в систему.' if  current_user.present?
  end
end
