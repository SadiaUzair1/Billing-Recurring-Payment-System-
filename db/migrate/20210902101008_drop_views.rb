class DropViews < ActiveRecord::Migration[6.1]
  def change
    drop_table :view
  end
end
