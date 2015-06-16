class AddCriticalToIssueType < ActiveRecord::Migration
  def change
    add_reference :issue_types, :critical_types, :index => true

  end
end
