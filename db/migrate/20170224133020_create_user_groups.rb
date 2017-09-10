class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name
      t.integer :role, default: 0

      t.timestamps null: false
    end

    UserGroup.create(
      [{name: 'regular'},
      {name: 'ceo'},
      {name: 'cto'},
      {name: 'designer'},
      {name: 'developer'},
      {name: 'volunteer'},
      {name: 'expert'}]
    )

    remove_column :users, :position, :integer, dafault: 0
    add_column :users, :user_group_id, :integer
    add_index :users, :user_group_id
  end
end
