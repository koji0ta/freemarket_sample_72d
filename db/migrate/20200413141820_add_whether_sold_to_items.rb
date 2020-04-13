class AddWhetherSoldToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :whether_sale, :boolean , default: false, null: false
  end
end
