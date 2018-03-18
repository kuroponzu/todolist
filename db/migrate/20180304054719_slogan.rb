class Slogan < ActiveRecord::Migration[5.0]
  def change
    add_column :slogans ,:title,:string
    add_column :slogans ,:category,:string
  end
end
