class AddTitleToReviews < ActiveRecord::Migration
  change_table :reviews do |t|
    t.string :title
  end
end
