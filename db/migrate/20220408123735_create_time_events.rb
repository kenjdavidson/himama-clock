class CreateTimeEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :time_events do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :event_time, null: false
      t.integer :event_type, null: false

      t.timestamps
    end
  end
end
