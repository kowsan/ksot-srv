class AutoWorkSpace < ActiveRecord::Base
  belongs_to :work_space
  has_and_belongs_to_many :work_spaces



  def self.unassigned
    AutoWorkSpace.includes(:work_spaces).all.reject { |x| x.work_spaces.count >0 }
  end

  def self.current_aws(appid)
    return AutoWorkSpace.find_by_uuid(appid)
  end





  def self.can_anonymous?(app_id)
    begin
      where(:uuid => app_id).first.allow_anonymous?
    rescue
      false
    end

  end




end
