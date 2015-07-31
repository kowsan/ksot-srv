class IssueType < ActiveRecord::Base
  belongs_to :critical_type
  has_and_belongs_to_many :work_spaces
  has_many :issues

  default_scope {where(:is_enabled => true)}
  validates_presence_of :name,:critical_type_id
  def display_name
    "#{self.name} (#{self.critical_type.name})"
  end
end
