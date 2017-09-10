class ChangeLocationTypeField < ActiveRecord::Migration
  def change
    remove_column :aeds, :location_type, :integer, default: 0
    add_column :aeds, :location_type, :string

    remove_column :aeds, :availability, :integer, default: 0
    add_column :aeds, :availability, :string

    add_column :aeds, :email, :string
  end
end
