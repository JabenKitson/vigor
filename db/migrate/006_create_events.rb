class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :ecat
      t.string :etitle
      t.text :einfo
      t.datetime :edate
      t.datetime :etimestart
      t.datetime :etimeend
      t.string :elocation
      t.string :econtactname
      t.string :econtactphone
      t.string :econtactemail
      t.text :edirections
      t.text :emaps
      t.string :ecost
      t.text :elinkmoreinfo
      t.boolean :active

      t.timestamps
    end
  end
  def self.down
    drop_table :events
  end
end
