class TurnType < ActiveRecord::Base
  has_many :turn_schemes
  has_many :exclusion_days,:dependent => :destroy
  validates_presence_of :name

end
