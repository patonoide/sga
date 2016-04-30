class AddStatusToRecordUser < ActiveRecord::Migration
  def change
    add_reference :record_users, :status, index: true, foreign_key: true
  end
end
