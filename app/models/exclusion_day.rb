class ExclusionDay < ActiveRecord::Base
  belongs_to :turn_scheme
  belongs_to :turn_type
  validates_presence_of :turn_type_id,:turn_scheme_id,:day


  def to_s
    day.strftime("%d.%m.%Y")
  end







end
