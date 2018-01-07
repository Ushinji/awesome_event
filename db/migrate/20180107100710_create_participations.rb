class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.references :event, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :comment
      t.timestamps
    end
    add_index :participations, [:user_id, :event_id], unique: true
    add_index :participations, [:event_id, :user_id], unique: true
  end
end
