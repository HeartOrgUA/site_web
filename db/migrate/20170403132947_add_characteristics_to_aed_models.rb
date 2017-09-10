class AddCharacteristicsToAedModels < ActiveRecord::Migration
  def change
    add_column :aed_models, :characteristics, :text, array: true, default: []
  end
end
