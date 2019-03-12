class AddSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |s|
      s.belongs_to :user
      s.string :token

      s.timestamps
    end
  end
end
