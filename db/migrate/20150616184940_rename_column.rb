class RenameColumn < ActiveRecord::Migration
  def change
    remove_column :issue_types, :critical_types_id,:critical_type_id
  end
end
