class CreateJoinTransactionPlan < ActiveRecord::Migration[6.1]
  def change
    create_table :join_transaction_plans do |t|
      t.string :transactions
      t.string :plans

      t.timestamps
    end
  end
end
