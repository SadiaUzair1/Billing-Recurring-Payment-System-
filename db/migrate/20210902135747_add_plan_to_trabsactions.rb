class AddPlanToTrabsactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :plan
  end
end
