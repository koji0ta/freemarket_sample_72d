class Place < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :post_code, null: false
      t.string :prefecture, null: false
      t.string :city_name, null: false
      t.string :address, null: false
      t.string :building
      t.integer :user_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
