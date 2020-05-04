class KalendarController < ApplicationController
  before_action :redirect_unless_logged_in

  def home; end
end
