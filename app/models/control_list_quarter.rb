class ControlListQuarter < ActiveRecord::Base
  belongs_to :author, :class_name => User
  belongs_to :subdivision
  has_many :control_list_quarter_links
  has_many :control_list_quarter_factors, :through => :control_list_quarter_links

  def total
    control_list_quarter_factors.count
  end

  def self.in_list(from: '', to: '', start_bal: '', stop_bal: '')
    ControlListQuarter.includes(:control_list_quarter_factors, :control_list_quarter_links).where(:form_date => from..to).select { |x| x.total>= start_bal && x.total < stop_bal }

  end

  #ControlListQuarter.in_list(:from => '', :to => '', :start_bal => '', :stop_bal => '')
end
