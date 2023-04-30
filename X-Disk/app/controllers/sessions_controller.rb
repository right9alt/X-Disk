class SessionsController < ApplicationController
  before_action :is_auth?, only: [:create]

  def create
    user = User.find_by(login: params[:login])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to storage_path, notice: 'Вы успешно вошли в систему.'
    else
      flash[:alert] = 'Неверные логин или пароль.'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Вы успешно вышли из системы.'
  end
end
