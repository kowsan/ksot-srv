class AutoWorkSpace < ActiveRecord::Base
  belongs_to :work_space

  def self.unassigned
    where(:work_space_id => nil)
  end

  def self.can_anonymous?(app_id)
    begin
      where(:uuid => app_id).first.allow_anonymous?
    rescue
      false
    end

  end


end
