class ControlListMonth < ActiveRecord::Base
  has_many :control_list_month_links ,:dependent => :destroy
  belongs_to :author, :class_name => User

  belongs_to :subdivision
  validates_presence_of :form_date, :author_id, :subdivision_id
end
