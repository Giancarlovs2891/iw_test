class SetDefaultNameTask < ActiveRecord::Migration
  def change
    change_column :tasks, :name, :string, :default => 'Unnamed task'
  end
end
