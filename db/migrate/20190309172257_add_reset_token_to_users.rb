class AddResetTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |u|
      u.string :reset_token
    end
  end
end
