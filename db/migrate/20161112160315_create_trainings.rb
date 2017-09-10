class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.integer :duration
      t.integer :prerequisites, default: 0
      t.datetime :start_date

      t.timestamps null: false
    end

    create_table :trainings_users do |t|
      t.belongs_to :user
      t.belongs_to :training
    end
  end
end
