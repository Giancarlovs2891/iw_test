class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @task = Task.new
      @project = Project.new
      @projects = Project.where(user: current_user).order("name ASC")
      # @tasks = Task.all.order("updated_at DESC")
      @tasks = Task.joins(:project).where(:projects => {user: current_user}).order("updated_at DESC")
    else
      redirect_to root_path
    end
  end
end
