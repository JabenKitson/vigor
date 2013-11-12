class ChangeTypeInVegresources < ActiveRecord::Migration

  change_table :vegresources do |t|
  t.remove :type
  t.string :vrtype
  end
end

