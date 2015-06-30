class AddIssueType < ActiveRecord::Migration
  def change
    add_reference :issues,:issue_type
  end
end
