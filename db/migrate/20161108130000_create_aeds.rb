class CreateAeds < ActiveRecord::Migration
  def change
    create_table :aeds do |t|
      t.string :name
      t.string :city
      t.string :address
      t.integer :location_type, default: 0
      t.st_point :lonlat, geographic: true

      t.index :lonlat, using: :gist

      t.timestamps null: false
    end
  end
end
