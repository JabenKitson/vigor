class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.integer :contact_id
      t.date :date
      t.boolean :new_member
      t.boolean :renewal
      t.text :comments
      t.string :earmark

      t.timestamps
    end
  end

  def self.down
    drop_table :donations
  end
end
