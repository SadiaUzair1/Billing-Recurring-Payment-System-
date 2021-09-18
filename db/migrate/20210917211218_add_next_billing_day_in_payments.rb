class AddNextBillingDayInPayments < ActiveRecord::Migration[6.1]
  def change
    remove_column(:payments, :billing_day, :string)
    add_column :payments, :next_billing_day, :date, null: false, default: Time.zone.today
    add_column :payments, :billing_day, :date, null: false, default: Time.zone.today + 1.month
  end
end
