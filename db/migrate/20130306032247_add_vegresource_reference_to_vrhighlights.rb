class AddVegresourceReferenceToVrhighlights < ActiveRecord::Migration
  def change
    change_table :vrhighlights do |t|
      t.references :vegresource
    end
  end
end
