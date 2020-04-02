class RenameCaetegoryColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :caetegory_id, :category_id
  end
end
