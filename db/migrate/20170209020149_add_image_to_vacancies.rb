class AddImageToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :image, :string
  end
end
