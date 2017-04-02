class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @tasks = Task.all.order("updated_at DESC")
    else
      redirect_to root_path
    end
  end
end
