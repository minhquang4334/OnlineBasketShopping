class FixOrderTable < ActiveRecord::Migration[5.2]
  def change
    remove_reference :orders, :detail_model
    add_column :orders, :price, :integer
    remove_column :orders, :quantity, :integer
  end
end
