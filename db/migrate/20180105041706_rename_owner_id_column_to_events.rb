class RenameOwnerIdColumnToEvents < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :owner_id, :user
  end
end
