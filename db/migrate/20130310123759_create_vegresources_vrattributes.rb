class CreateVegresourcesVrattributes < ActiveRecord::Migration
  def up
    create_table :vegresources_vrattributes do |t| 
       t.references 'vegresource'
       t.references 'vrattribute'
    end
  end

  def down
    drop_table :vegresources_vrattributes
  end
end
