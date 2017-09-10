class AddImagesToAeds < ActiveRecord::Migration
  def change
    add_column :aeds, :images, :json
  end
end
