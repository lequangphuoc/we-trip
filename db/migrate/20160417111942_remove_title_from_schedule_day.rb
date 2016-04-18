class RemoveTitleFromScheduleDay < ActiveRecord::Migration
  def change
    remove_column :schedule_days, :title
  end
end
