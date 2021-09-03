class AddColumnsToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :name, :string
    add_column :plans, :monthly_fee, :string
    add_column :plans, :col2, :integer
  end
end
