class AddImagesToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :images, :json
  end
end
