class Issue < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :issue_type, unscoped: true
  belongs_to :status
  belongs_to :work_space
  belongs_to :assigned, :class_name => 'User'
  belongs_to :violator, :class_name => 'User'
  belongs_to :modifier, :class_name => 'User'
  has_one :critical_type, :through => :issue_type

  validates_presence_of :status_id, :violator_id, :assigned_id
  validates_presence_of :work_space_id



  after_save :update_cache
  private
  def update_cache
    d=created_at.to_date
    key=d.to_s+'_'+work_space_id.to_s
    w = Issue.includes(:critical_type).includes(:work_space).where('date(issues.created_at) =?', d).where(:work_space_id => work_space_id).maximum(:weight) || 0
    if w==0
      clr='#97D077'
    else
      clr=CriticalType.where(:weight => w).first.color.to_s
    end
    $redis.set(key, clr)
  end


  def self.max_on(date, work_space_id)
    # d=created_at.to_date
    key=date.to_s+'_'+work_space_id.to_s
    # w = Issue.includes(:critical_type).includes(:work_space).where('date(issues.created_at) =?', d).where(:work_space_id => work_space_id).maximum(:weight) || 0
    #$redis.set(key,w)
    if $redis.get(key).nil?
      w = Issue.includes(:critical_type).includes(:work_space).where('issues.created_at >=? AND issues.created_at <=?', date.at_beginning_of_day, date.at_end_of_day).where(:work_space_id => work_space_id).maximum(:weight) || 0
      if w==0
        clr='#97D077'
      else
        clr=CriticalType.where(:weight => w).first.color.to_s
      end
      $redis.set(key, clr)
    end
    return $redis.get(key)
  end


end
