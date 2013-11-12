class CreateListCats < ActiveRecord::Migration
  def self.up
    create_table :list_cats do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :list_cats
  end
end
