class WorkLists < ActiveRecord::Migration[5.0]
  def change
    add_column :work_lists,:work_date_completed,:datetime
  end
end
