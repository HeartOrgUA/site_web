class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.string :short_description
      t.text :description

      t.timestamps null: false
    end
  end
end
