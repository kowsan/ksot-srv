class WorkSpace < ActiveRecord::Base
  has_many :auto_work_spaces
  belongs_to :subdivision
  validates_presence_of :name,:subdivision_id
end
