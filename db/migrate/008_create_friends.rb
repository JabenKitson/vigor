class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :hphone
      t.string :wphone
      t.string :cphone
      t.string :fax
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end
