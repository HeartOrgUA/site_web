class AddModelToAeds < ActiveRecord::Migration
  def change
    add_column :aeds, :area, :string
    add_column :aeds, :district, :string
    add_column :aeds, :phone, :string
    add_column :aeds, :owner, :string
    add_column :aeds, :description, :string
    add_column :aeds, :availability, :integer, default: 0
    add_column :aeds, :aed_model_id, :integer
    add_index :aeds, :aed_model_id
  end
end
