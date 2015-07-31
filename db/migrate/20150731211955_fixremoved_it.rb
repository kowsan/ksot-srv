class FixremovedIt < ActiveRecord::Migration
  def change
    Issue.find_each(:batch_size => 50) do |i|
      if i.issue_type_id.nil?
        i.issue_type_id=IssueType.first.id
        i.save!
      end
    end
  end
end
