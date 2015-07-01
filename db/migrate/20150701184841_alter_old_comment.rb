class AlterOldComment < ActiveRecord::Migration
  def change
    AutoWorkSpace.all.each do |a|
      a.comment='' if a.comment.nil?
      a.save!
    end

  end
end
