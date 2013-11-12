class RemoveTitleFromRecipes < ActiveRecord::Migration
change_table :recipes do |t|
  t.rename :title, :name
end
end
