class ChangeDatatypeBirthOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birth, :date
  end
end
