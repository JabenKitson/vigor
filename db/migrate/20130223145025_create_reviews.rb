class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.text :rating
      t.references :vegresource
      t.references :event
      t.references :user

      t.timestamps
    end
  end
end
