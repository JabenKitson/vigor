class CreateVrhighlights < ActiveRecord::Migration
  def change
    create_table :vrhighlights do |t|
      t.decimal :price
      t.date :date_observed
      t.string :name
      t.string :product_url
      t.string :recipe_url
      t.integer :user_id
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
