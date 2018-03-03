class WorkList < ActiveRecord::Migration[5.0]
  def change
    create_table :work_lists do |t|
      t.string :work,null: false
      t.datetime :work_date,null: false
      t.string :worker,null: false
      t.string :authorizer,null: false
    end
  end
end
