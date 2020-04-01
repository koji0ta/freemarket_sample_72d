class RemovePasswordToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :Users, :password, :string
    remove_column :Users, :password_confirmation, :string
  end
end
