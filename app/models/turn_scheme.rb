class TurnScheme < ActiveRecord::Base
  has_many :turn_types
  has_many :work_spaces
end
