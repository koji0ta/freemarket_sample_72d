class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :customer_id, null: false
      t.string :card_id, null: false

      # t.integer :number, null: false, unique: true
      # t.integer :expiration_date, null: false
      # t.integer :authorization_number, null: false
      
      t.timestamps
    end
  end
end
