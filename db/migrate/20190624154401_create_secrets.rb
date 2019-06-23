class CreateSecrets < ActiveRecord::Migration[5.2]
  def self.up
    create_table :secrets do |t|
      t.column "title", :string
      t.column "content", :string
      t.column "revealed", :boolean
      t.column "page_id", :integer
    end
  end

  def self.down
    drop_table :secrets
  end
end
