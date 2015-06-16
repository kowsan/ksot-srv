class WorkSpace < ActiveRecord::Base
  has_many :auto_work_spaces
  belongs_to :subdivision
  has_and_belongs_to_many :issue_types
  validates_presence_of :name,:subdivision_id
end
