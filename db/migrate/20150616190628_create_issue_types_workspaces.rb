class CreateIssueTypesWorkspaces < ActiveRecord::Migration
  def change

    create_join_table :work_spaces, :issue_types
  end
end
