class AddNumberToRecord < ActiveRecord::Migration
  def change
    add_column :records, :number, :integer
  end
end
