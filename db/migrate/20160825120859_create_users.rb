class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username
      t.text :pass
      t.integer :total_ads, default: 0
      t.integer :reputation, default: 0
      t.timestamps
    end
    add_index :users, :id
    add_index :users, :reputation
    add_index :users, :username
  end
end
