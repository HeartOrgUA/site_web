class CreateTableParticipantsTrainings < ActiveRecord::Migration
  def change
    create_table :participant_trainings do |t|
      t.integer :training_id, index: true
      t.integer :user_id, index: true
    end
  end
end
