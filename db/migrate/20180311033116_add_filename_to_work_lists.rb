class AddFilenameToWorkLists < ActiveRecord::Migration[5.0]
  def change
    add_column :work_lists, :file_name, :string
  end
end
