class AddPublicationDateToNews < ActiveRecord::Migration
  def change
    add_column :news, :publication_date, :datetime
  end
end
