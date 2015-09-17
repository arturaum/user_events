class MyCalendarController < ApplicationController
  def index
    unless current_user
      redirect_to login_path and return
    end
  end
end
