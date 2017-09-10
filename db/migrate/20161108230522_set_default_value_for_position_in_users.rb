class SetDefaultValueForPositionInUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :position, default: 0
  end
end
