class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @task = Task.new
      @project = Project.new
      @projects = Project.where(user_id: current_user.id).order("name ASC")
      @tasks = Task.joins("INNER JOIN projects ON projects.id = tasks.project_id AND projects.user_id = #{current_user.id}").order("updated_at DESC")

    else
      redirect_to root_path
    end
  end
end
