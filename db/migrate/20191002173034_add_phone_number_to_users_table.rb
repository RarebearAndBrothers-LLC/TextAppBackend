class AddPhoneNumberToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cell, :string
  end
end
