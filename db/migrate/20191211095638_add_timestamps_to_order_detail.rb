class AddTimestampsToOrderDetail < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :order_details, null: true
  end
end
