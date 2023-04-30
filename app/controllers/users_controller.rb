class UsersController < ApplicationController
  before_action :is_auth?, only: [:create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to storage_path, notice: 'Вы успешно зарегестрировались.'
    else
      if @user.errors.any?
        flash.now[:error] = @user.errors.full_messages.join(", ")
      end
      render :new, status: :unprocessable_entity
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end
