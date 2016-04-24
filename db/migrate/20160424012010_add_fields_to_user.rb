class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_reference :users, :sector, index: true, foreign_key: true
  end
end
