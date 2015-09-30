class Issue < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :issue_type, unscoped: true
  belongs_to :status
  belongs_to :work_space, :unscoped => true
  belongs_to :assigned, :class_name => 'User'
  belongs_to :violator, :class_name => 'User'
  belongs_to :modifier, :class_name => 'User'
  has_one :critical_type, :through => :issue_type

  validates_presence_of :status_id, :violator_id, :assigned_id
  validates_presence_of :work_space_id
  validates_presence_of :issue_type_id,:message => 'не может быть пустым'
  after_save :drop_redis_cache


  private


  def update_cache_new
    key='turn_'+work_space_id.to_s+created_at.to_date.to_s
    if $redis.del(key)
      Issue.max_on(created_at.to_date.to_s, work_space_id)
    end
  end

  def self.max_on_day(date)
    key='max_in_day_'+date.to_s
    if $redis.get(key).nil?
      w = Issue.includes(:critical_type).includes(:work_space).where('issues.created_at >=? AND issues.created_at <=?', date.at_beginning_of_day, date.at_end_of_day).maximum(:weight) || 0
      if w==0
        clr='#97D077'
      else
        clr=CriticalType.where(:weight => w).first.color.to_s
      end
      $redis.set(key, clr)
    end
    return $redis.get(key)
  end


  def self.smene_count(date, work_space_id)
    ws= WorkSpace.find(work_space_id)
    q= ws.turn_scheme.exclusion_days.where(:day => date).limit(1)
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
    sc=tt.count
    sc
  end

  def self.max_on(date, work_space_id)
    key='turn_'+work_space_id.to_s+date.to_s

    if $redis.get(key).nil?
      ws= WorkSpace.find(work_space_id)

      q= ws.turn_scheme.exclusion_days.where(:day => date).limit(1)
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
      sc=tt.count
      # sc=self.smene_count(date, work_space_id)

      case sc
        when 0
          w = Issue.includes(:critical_type).includes(:work_space).where('issues.created_at >=? AND issues.created_at <=?', date.at_beginning_of_day, date.at_end_of_day).where(:work_space_id => work_space_id).maximum(:weight) || 0
          if w==0
            clr='#333333'
          else
            clr=CriticalType.where(:weight => w).first.color.to_s
          end
        when 1
          w = Issue.includes(:critical_type).includes(:work_space).where('issues.created_at >=? AND issues.created_at <=?', date.to_datetime+tt.first_start_at.hour.hours+tt.first_start_at.min.minutes, date.to_datetime+tt.first_start_at.hour.hours+tt.first_duration.hour.hours+ tt.first_start_at.min.minutes+ tt.first_duration.min.minutes).where(:work_space_id => work_space_id).maximum(:weight) || 0
          if w==0
            clr='#97D077'
          else
            clr=CriticalType.where(:weight => w).first.color.to_s
          end


        when 2
          w1 = Issue.includes(:critical_type).includes(:work_space).where('issues.created_at >=? AND issues.created_at <=?', date.to_datetime+tt.first_start_at.hour.hours+tt.first_start_at.min.minutes, date.to_datetime+tt.first_start_at.hour.hours+tt.first_duration.hour.hours+ tt.first_start_at.min.minutes+ tt.first_duration.min.minutes).where(:work_space_id => work_space_id).maximum(:weight) || 0
          if w1==0
            clr1='#97D077'
          else
            clr1=CriticalType.where(:weight => w1).first.color.to_s
          end
          w2 = Issue.includes(:critical_type).includes(:work_space).where('issues.created_at >=? AND issues.created_at <=?', date.to_datetime+tt.second_start_at.hour.hours+tt.second_start_at.min.minutes, date.to_datetime+tt.second_start_at.hour.hours+tt.second_duration.hour.hours+ tt.second_start_at.min.minutes+ tt.second_duration.min.minutes).where(:work_space_id => work_space_id).maximum(:weight) || 0
          if w2==0
            clr2='#97D077'
          else
            clr2=CriticalType.where(:weight => w2).first.color.to_s
          end
          clr="#{clr1},#{clr2}"
          puts "2 smene detect#{clr}"

        else
          clr='#97D077'
      end

      $redis.set(key, clr)
      puts key, clr

    end

    return $redis.get(key)

  end


end
