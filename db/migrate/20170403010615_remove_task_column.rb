class RemoveTaskColumn < ActiveRecord::Migration
  def change
    remove_column :tasks, :total_time
  end
end
