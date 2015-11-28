class TurnCloseInfo < ActiveRecord::Base
  belongs_to :turn_type
  belongs_to :work_space
  belongs_to :auto_work_space
  belongs_to :closed_by, :class_name => User
  validates :closed_by, :presence => true
  validates :close_date, :presence => true
  validates :work_space, :presence => true
end
