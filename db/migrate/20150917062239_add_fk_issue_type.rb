class AddFkIssueType < ActiveRecord::Migration
  def change
    #Issue.where(:issue_types => nil).delete_all
    add_foreign_key(:issues,:issue_types)
  end
end
