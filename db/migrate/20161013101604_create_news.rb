class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.json :images

      t.timestamps null: false
    end
  end
end
