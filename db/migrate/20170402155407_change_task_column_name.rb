class ChangeTaskColumnName < ActiveRecord::Migration
  def change
    change_column :tasks, :total_time, :integer
  end
end
