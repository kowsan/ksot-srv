class AddColumn < ActiveRecord::Migration
  def change
    add_column :issue_types,:critical_type_id,:integer
  end
end
