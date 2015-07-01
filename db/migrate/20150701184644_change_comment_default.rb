class ChangeCommentDefault < ActiveRecord::Migration
  def change
    change_column_default :auto_work_spaces,:comment,''
  end
end
