class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :start_count
      t.time :start_time
      t.time :end_time
      t.integer :total_time

      t.timestamps null: false
    end
  end
end
