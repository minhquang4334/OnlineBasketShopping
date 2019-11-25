class DropAdmin < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :questions, :admins
    drop_table :admins
  end
end
