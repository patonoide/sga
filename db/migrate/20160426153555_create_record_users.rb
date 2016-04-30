class CreateRecordUsers < ActiveRecord::Migration
  def change
    create_table :record_users do |t|
      t.references :record, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
