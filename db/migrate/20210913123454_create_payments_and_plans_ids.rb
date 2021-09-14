class CreatePaymentsAndPlansIds < ActiveRecord::Migration[6.1]
  def change
    create_table :payments_and_plans_ids do |t|
      t.references :plan
      t.references :payment

      t.timestamps
    end
  end
end
