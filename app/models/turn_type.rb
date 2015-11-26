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

  def self.turn_times(work_space_id)
    fs=0
    ss=0
    begin
      ws= WorkSpace.find(work_space_id)
      q= ws.turn_scheme.exclusion_days.where(:day => Date.current).limit(1)
      if q.blank?
        puts "date not in exclusion day" #do standart check for turn shmeme
        tt=TurnType.find(ws.turn_scheme.turn_type.id)
      else
        puts "date  in exclusion day"
        #get turn_type from custom turn_sheme
        tt=TurnType.find(q.first.turn_type.id)

      end
      #get turn type

      #get smens count in day
      sc=tt.smene_count


      case sc

        when 0
          return 0
        when 1
          fs=Date.current.to_datetime+tt.first_start_at.seconds_since_midnight.seconds+tt.first_duration.seconds_since_midnight.seconds-Time.current.utc_offset.seconds
          fs=fs.to_i-Time.current.to_i
        when 2
          fs=Date.current.to_datetime+tt.first_start_at.seconds_since_midnight.seconds+tt.first_duration.seconds_since_midnight.seconds-Time.current.utc_offset.seconds
          fs=fs.to_time
          ss=Date.current.to_datetime+tt.second_start_at.seconds_since_midnight.seconds+tt.second_duration.seconds_since_midnight.seconds-Time.current.utc_offset.seconds
          ss=ss.to_time

          fs=fs.to_i-Time.current.to_i
          ss=ss.to_i-Time.current.to_i
      end
    rescue Exception => e
      puts e.message
    end
    return ws.name, fs, ss
  end

  def self.humanize(secs)
    [[60, 'секунд'], [60, 'минут'], [24, 'часов'], [1000, 'дней']].map { |count, name|
      if secs > 0
        secs, n = secs.divmod(count)
        "#{n.to_i} #{name}"
      end
    }.compact.reverse.join(' ')
  end

  def can_delete
    turn_schemes.count==0
  end
end
