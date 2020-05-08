class ChangeDataFinishAtToTasks < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :finish_at, :datetime
  end
end
