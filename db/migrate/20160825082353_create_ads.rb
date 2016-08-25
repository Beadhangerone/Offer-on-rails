class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.text :author
      t.text :category
      t.text :bill_type
      t.text :ad_header
      t.text :ad_text
      t.integer :views, default: 0
      t.timestamps
    end
    add_index :ads, :id
    add_index :ads, :category
    add_index :ads, :bill_type
    add_index :ads, :ad_header
    add_index :ads, :views
  end
end