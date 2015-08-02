class TurnType < ActiveRecord::Base
  has_many :turn_schemes
  has_many :exclusion_days
  validates_presence_of :name

end
