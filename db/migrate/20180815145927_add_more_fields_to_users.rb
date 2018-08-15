class AddMoreFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    User.delete_all
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :patronymic, :string
    add_column :users, :function_id, :integer
  end
end
