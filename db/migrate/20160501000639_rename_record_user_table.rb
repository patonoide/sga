class RenameRecordUserTable < ActiveRecord::Migration
  def change
    rename_table :record_users, :records_users
  end
end
