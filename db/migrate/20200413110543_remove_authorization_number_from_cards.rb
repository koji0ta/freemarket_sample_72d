class RemoveAuthorizationNumberFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :authorization_number, :integer
  end
end
