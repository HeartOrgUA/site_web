class AddApprovedToAeds < ActiveRecord::Migration
  def change
    add_column :aeds, :approved, :integer, default: 0
  end
end
