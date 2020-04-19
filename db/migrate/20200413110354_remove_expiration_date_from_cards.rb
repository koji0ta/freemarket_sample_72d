class RemoveExpirationDateFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :expiration_date, :integer
  end
end
