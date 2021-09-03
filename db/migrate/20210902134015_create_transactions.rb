class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :billing_day

      t.timestamps
    end
  end
end
