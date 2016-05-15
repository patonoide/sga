class AddDiscussionToRecord < ActiveRecord::Migration
  def change
    add_column :records, :discussion, :text
  end
end
