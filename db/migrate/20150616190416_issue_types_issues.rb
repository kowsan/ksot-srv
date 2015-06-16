class IssueTypesIssues < ActiveRecord::Migration
  def change
    create_join_table :issues,:issue_types
  end
end
