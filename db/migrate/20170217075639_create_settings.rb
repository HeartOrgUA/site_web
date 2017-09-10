class CreateSettings < ActiveRecord::Migration
  def up
    create_table :settings do |t|
      t.integer :setting_type, default: 0
      t.string :affected_model
      t.string :value

      t.timestamps null: false
    end

    Setting.create(affected_model: 'project', value: 'id')
    Setting.create(affected_model: 'vacancy', value: 'id')
    Setting.create(affected_model: 'training', value: 'id')
    Setting.create(affected_model: 'user', value: 'id')

    Setting.create(affected_model: 'project', setting_type: 1, value: 'desc')
    Setting.create(affected_model: 'vacancy', setting_type: 1, value: 'desc')
    Setting.create(affected_model: 'training', setting_type: 1, value: 'asc')
    Setting.create(affected_model: 'user', setting_type: 1, value: 'asc')
  end

  def down
    drop_table :settings
  end
end
