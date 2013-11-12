class UpdateVegResources < ActiveRecord::Migration
  change_table :vegresources do |t|
  t.remove :isbn
  t.string :author
  end
end