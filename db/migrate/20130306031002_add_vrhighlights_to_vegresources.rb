class AddVrhighlightsToVegresources < ActiveRecord::Migration
  def change
    change_table :vegresources do |t|
      t.references :vrhighlights
    end
  end
end
