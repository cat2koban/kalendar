class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_path, flash: { success: 'Logged in successfully.' }
    else
      redirect_to login_path, flash: { danger: 'Invalid email/password combination.' }
    end
  end

  def destroy
    log_out
    redirect_to login_path, flash: { success: 'Logged out successfully.' }
  end
end
