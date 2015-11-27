class TurnCloseInfo < ActiveRecord::Base
  belongs_to :turn_type
  belongs_to :closed_by,:class_name => User
  validates :closed_by,:presence => true
  validates :close_date,:presence => true
end
