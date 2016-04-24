class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :records, :users do |t|
      # t.index [:record_id, :user_id]
      # t.index [:user_id, :record_id]
    end
  end
end
