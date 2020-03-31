class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :description, null: false
      t.integer :status, null: false
      t.integer :cost, null: false
      t.integer :days, null: false
      t.string :size
      t.integer :caetegory_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
