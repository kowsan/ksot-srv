class Turn < ActiveRecord::Base
  belongs_to :turn_type
  validates_presence_of :turn_type_id,:day_date
end
