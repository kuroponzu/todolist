class Slogans < ActiveRecord::Migration[5.0]
  def change
      add_column :slogans, :content, :text
  end
end
