class ControlListQuarterLink < ActiveRecord::Base
  belongs_to :control_list_quarter
  belongs_to :control_list_quarter_factor_group
  belongs_to :control_list_quarter_factor

end
