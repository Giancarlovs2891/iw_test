require 'rails_helper'

RSpec.describe Project, type: :model do
  it "save project" do
    project = Project.new(name: "Rspect project")
    project.save
  end

end
