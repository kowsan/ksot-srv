class FixRemovedIssueType < ActiveRecord::Migration
  def change
    Issue.find_each(:batch_size => 50) do |i|
      if i.work_space_id.nil?
        i.work_space_id=WorkSpace.first
        i.save!
      end
    end
  end
end
