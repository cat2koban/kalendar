class ChangeDataStartAtToTasks < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :start_at, :datetime
  end
end
