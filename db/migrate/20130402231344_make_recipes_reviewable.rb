class MakeRecipesReviewable < ActiveRecord::Migration
change_table :reviews do |t|
  t.references :recipe
end
end
