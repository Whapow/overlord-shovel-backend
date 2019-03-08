class AddPasswordToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |u|
      u.rename :display_name, :username
      u.rename :name, :first_name
      u.string :last_name
      u.string :password_digest
    end

    User.all.each do |user|
      temporary_password = user.username + "123"
      user.update(password: temporary_password)
    end
  end
end
