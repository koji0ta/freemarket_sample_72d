class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :post_code,null:false
      t.string :prefecture,null:false
      t.string :city_name,null:false
      t.string :address,null:false
      t.string :building
      t.integer :user_id,null: false, foreign_key: true
      t.timestamps
    end
  end
end
