class AddUserReferences < ActiveRecord::Migration
change_table :events do |t|
  t.references :user
end

change_table :recipes do |t|
  t.references :user
end

end
