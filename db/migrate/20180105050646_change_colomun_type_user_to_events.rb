class ChangeColomunTypeUserToEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :user, :integer
  end
end
