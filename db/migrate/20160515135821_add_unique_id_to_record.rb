class AddUniqueIdToRecord < ActiveRecord::Migration
  def change
    add_column :records, :unique_id, :string
  end
end
