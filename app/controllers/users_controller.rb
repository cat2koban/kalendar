class UsersController < ApplicationController
  before_action :redirect_unless_logged_in, only: [:show]
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    if is_current_user?(@user)
      @tasks = @user.tasks.first(5)
    else
      redirect_to root_path, flash: { danger: '閲覧権限がありません。原則、他のユーザーのプロフィール情報は閲覧することができません。' }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user, flash: { success: 'Your account has been successfully created.' }
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
