class KalendarController < ApplicationController
  before_action :redirect_unless_logged_in

  def home
    @user = current_user
  end
end
