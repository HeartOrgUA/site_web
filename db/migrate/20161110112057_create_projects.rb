class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :canonical_name
      t.text :description

      t.timestamps null: false
    end
  end
end
