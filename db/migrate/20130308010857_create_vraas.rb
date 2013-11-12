class CreateVraas < ActiveRecord::Migration
  def change
    create_table :vraas do |t|
      t.references :vrattribute
      t.references :vegresource
      t.timestamps
    end
  end
end
