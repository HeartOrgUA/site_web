class AlterColumnAtTrainings < ActiveRecord::Migration
  def change
    rename_column :trainings, :prerequisites, :prerequisite
  end
end
