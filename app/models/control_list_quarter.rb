class ControlListQuarter < ActiveRecord::Base
  belongs_to :author, :class_name => User
  belongs_to :subdivision
  has_many :control_list_quarter_links
  has_many :control_list_quarter_factors, :through => :control_list_quarter_links

  def total
     control_list_quarter_factors.count
  end
end
