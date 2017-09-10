class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :email
      t.string :name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
