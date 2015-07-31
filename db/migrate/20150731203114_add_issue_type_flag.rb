class AddIssueTypeFlag < ActiveRecord::Migration
  def change
    add_column :issue_types,:is_enabled,:boolean,:default => true
  end
end
