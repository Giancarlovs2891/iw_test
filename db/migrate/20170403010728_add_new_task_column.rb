class AddNewTaskColumn < ActiveRecord::Migration
  def change
    add_column :tasks, :total_time, :integer, :default => 0
  end
end
