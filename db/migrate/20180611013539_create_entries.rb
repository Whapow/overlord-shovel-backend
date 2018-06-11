class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_join_table :journals, :characters, table_name: :entries do |t|
      t.integer :experience
      t.decimal :reward
    end
  end
end
