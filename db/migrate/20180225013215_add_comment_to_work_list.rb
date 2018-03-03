class AddCommentToWorkList < ActiveRecord::Migration[5.0]
  def change
    add_column :work_lists, :comment, :text
  end
end
