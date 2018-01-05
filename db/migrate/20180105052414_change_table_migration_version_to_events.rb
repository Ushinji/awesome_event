class ChangeTableMigrationVersionToEvents < ActiveRecord::Migration[5.1]
  def change
    drop_table :events

    create_table :events do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
      t.string :place, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
