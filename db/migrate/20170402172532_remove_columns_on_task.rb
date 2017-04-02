class RemoveColumnsOnTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :start_time
    remove_column :tasks, :end_time
  end
end
