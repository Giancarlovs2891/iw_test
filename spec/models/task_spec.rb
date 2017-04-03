require 'rails_helper'

RSpec.describe Task, type: :model do
  it "save task" do
    project = Project.first
    task = Task.new(name: "task", total_time: 3600, project_id: 1)
    task.save
  end
end
