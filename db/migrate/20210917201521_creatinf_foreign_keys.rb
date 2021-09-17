class CreatinfForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :payments_and_plans_ids, :plans, index: true
    add_foreign_key :payments_and_plans_ids, :payments, index: true
  end
end
