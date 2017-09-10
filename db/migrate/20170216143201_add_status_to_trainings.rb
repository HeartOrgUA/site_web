class AddStatusToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :status, :integer, default: 0
  end
end
