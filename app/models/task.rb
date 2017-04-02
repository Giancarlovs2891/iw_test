class Task < ActiveRecord::Base
  belongs_to :projects

  def update_start_count
    self.update(start_count: self.start_count + 1)
  end
end
