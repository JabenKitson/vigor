class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.integer :friend_id
      t.integer :list_cat_id
      t.date :expires
      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
