class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :status
      t.string :address
      t.integer :phone_number
      t.integer :payment_id, :null => true
      t.string :receive_name
      t.references :payment_type, foreign_key: true
      t.references :shipping_type, foreign_key: true
      t.references :detail_model, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
