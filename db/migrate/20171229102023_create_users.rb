class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :nickname, null: true
      t.string :image_url, null: true
      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true
  end
end
