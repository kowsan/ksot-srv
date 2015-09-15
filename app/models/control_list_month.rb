class ControlListMonth < ActiveRecord::Base
  has_many :control_list_month_links
  belongs_to :author,:class_name => User
  belongs_to :subdivision
end
