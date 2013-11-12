class CreateContributes < ActiveRecord::Migration
  def self.up
    create_table :contributes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :contributes
  end
end
