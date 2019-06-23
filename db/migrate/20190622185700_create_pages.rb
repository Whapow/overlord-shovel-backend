class CreatePages < ActiveRecord::Migration[5.2]
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :campaign_id
      t.boolean :visible
    end
  end

  def self.down
    drop_table :pages
  end
end