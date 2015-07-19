class Issue < ActiveRecord::Base
  belongs_to :author,:class_name => 'User'
  belongs_to :issue_type
  belongs_to :status
  belongs_to :work_space
  belongs_to :assigned,:class_name => 'User'
  belongs_to :violator,:class_name => 'User'
  belongs_to :modifier,:class_name => 'User'
  has_one :critical_type,:through => :issue_type

  validates_presence_of :status_id,:violator_id,:assigned_id
  validates_presence_of :work_space_id


end
