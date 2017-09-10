class CreateNewsSubscribes < ActiveRecord::Migration
  def change
    create_table :news_subscribes do |t|
      t.string :email
      t.boolean :subscribed, default: true

      t.timestamps null: false
    end
  end
end
