class TurnType < ActiveRecord::Base
  has_many :turn_schemes
  has_many :exclusion_days, :dependent => :destroy
  validates_presence_of :name
  after_save :drop_redis_cache

  def smene_count
    if is_day_off?
      return 0
    end

    if support2?

      return 2
    end

    return 1

  end


  def can_delete
    turn_schemes.count==0
  end
end
