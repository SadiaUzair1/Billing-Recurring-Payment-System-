class AddUserToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :user
  end
end
