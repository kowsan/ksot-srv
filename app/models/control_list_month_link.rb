class ControlListMonthLink < ActiveRecord::Base
  belongs_to :control_list_month
  belongs_to :control_list_factor_group
  belongs_to :control_list_factor
  belongs_to :user
  belongs_to :status
end
