class TurnScheme < ActiveRecord::Base
  has_many :turn_types
  has_many :work_spaces
  validates_presence_of :name,:turn_type_id
end
