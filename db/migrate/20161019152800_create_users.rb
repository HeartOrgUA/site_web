class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :position
      t.string :grade_title
      t.text :bio

      t.timestamps null: false
    end
  end
end
