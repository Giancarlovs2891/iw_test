class ChangeTaksColumnType < ActiveRecord::Migration
  def change
    change_column :tasks, :total_time, :integer, :default => 0
  end
end
