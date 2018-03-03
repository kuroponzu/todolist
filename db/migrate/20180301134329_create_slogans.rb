class CreateSlogans < ActiveRecord::Migration[5.0]
  def change
    create_table :slogans do |t|

      t.timestamps
    end
  end
end
