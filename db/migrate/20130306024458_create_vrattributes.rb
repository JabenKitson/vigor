class CreateVrattributes < ActiveRecord::Migration
  def change
    create_table :vrattributes do |t|
      t.string :vrtype
      t.string :name

      t.timestamps
    end
  end
end
