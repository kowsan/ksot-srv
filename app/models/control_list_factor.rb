class ControlListFactor < ActiveRecord::Base
  belongs_to :control_list_factor_group
  validates_presence_of :control_list_factor_group_id
end
