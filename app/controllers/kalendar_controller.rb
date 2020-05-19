class KalendarController < ApplicationController
  before_action :redirect_unless_logged_in

  def home
    @tasks = current_user.tasks
  end
end
