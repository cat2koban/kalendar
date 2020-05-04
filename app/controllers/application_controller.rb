class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def redirect_unless_logged_in
    redirect_to login_path, flash: { danger: 'Please log in.' } unless logged_in?
  end

  def redirect_if_logged_in
    redirect_to root_path, flash: { danger: 'You are already logged in.' } if logged_in?
  end
end
