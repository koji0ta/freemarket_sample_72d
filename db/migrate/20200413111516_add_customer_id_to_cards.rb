class AddCustomerIdToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :customer_id, :string
  end
end
