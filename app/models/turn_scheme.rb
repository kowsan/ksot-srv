class TurnScheme < ActiveRecord::Base
  has_many :turn_types, :through => :exclusion_days
  has_many :work_spaces
  has_many :exclusion_days, :dependent => :destroy
  belongs_to :turn_type
  validates_presence_of :name, :turn_type_id
  after_save :drop_redis_cache


  def self.current_turn_end_at(work_space_id,date)
    ex=ExclusionDay.find_by_day(date)

  end

end
