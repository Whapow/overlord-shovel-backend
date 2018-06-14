class AddDeletedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleted, :boolean
  end
end
