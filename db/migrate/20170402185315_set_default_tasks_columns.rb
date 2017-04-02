class SetDefaultTasksColumns < ActiveRecord::Migration
  def change
    change_column :tasks, :start_count, :integer, :default => 0
    change_column :tasks, :total_time, :integer, :default => 0
  end
end
