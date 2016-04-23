class AddSectorToRecord < ActiveRecord::Migration
  def change
    add_reference :records, :sector, index: true, foreign_key: true
  end
end
