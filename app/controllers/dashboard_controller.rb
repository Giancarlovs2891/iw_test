class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @task = Task.new
      @project = Project.new
      @projects = Project.where(user_id: current_user.id).order("name ASC")
      @tasks = Task.all.order("updated_at DESC")
      # @tasks = current_user.project.task

    else
      redirect_to root_path
    end
  end
end
