class Issue < ActiveRecord::Base
  belongs_to :author,:class_name => 'User'
  belongs_to :issue_type
  belongs_to :status
  belongs_to :work_space
  belongs_to :assigned,:class_name => 'User'
  belongs_to :violator,:class_name => 'User'
  belongs_to :modifier,:class_name => 'User'




end
