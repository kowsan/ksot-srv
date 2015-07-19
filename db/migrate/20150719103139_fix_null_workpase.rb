class FixNullWorkpase < ActiveRecord::Migration
  def change
    Issue.where(:work_space_id => nil).find_each(:batch_size => 10) do |i|
      i.work_space=WorkSpace.first
      i.save!
    end
  end
end
