class CreateAedModels < ActiveRecord::Migration
  def change
    create_table :aed_models do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
