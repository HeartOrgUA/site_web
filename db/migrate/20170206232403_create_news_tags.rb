class CreateNewsTags < ActiveRecord::Migration
  def change
    create_table :news_tags do |t|
      t.integer :tag_id, index: true
      t.integer :news_id, index: true
    end
  end
end
