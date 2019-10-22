class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :picture, :string, :null => true
    add_column :users, :name, :string, :null => true
    add_column :users, :phone, :integer, :null => true
    add_column :users, :address, :string, :null => true
    add_column :users, :birthday, :date, :null => true
    add_column :users, :gender, :binary, :null => true
  end
end
