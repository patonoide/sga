class RemoveUniqueIdFromRecord < ActiveRecord::Migration
  def change
    remove_column :records, :unique_id, :string
  end
end
