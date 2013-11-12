class CreateVegresources < ActiveRecord::Migration
  def change
    create_table :vegresources do |t|
      t.string :type
      t.string :name
      t.string :website
      t.string :isbn
      t.text :address
      t.text :info
      t.string :phone
      t.references :user

      t.timestamps
    end
  end
end
