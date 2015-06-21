class AddIssueFields < ActiveRecord::Migration
  def change
    # belongs_to :issue_type
    add_reference :issues, :author, references: :users


    add_reference :issues, :assigned, references: :users
    # belongs_to :assigned,:class_name => 'User'
    add_reference :issues, :violator, references: :users
    # belongs_to :violator,:class_name => 'User'
    #modified by
    add_reference :issues, :modifier, references: :users

    #note about due
    add_column :issues, :note_due, :text
    #note about meropriyatiya
    add_column :issues, :note_measures, :text
    add_column :issues, :info, :text
  end

end
