class ChanfeARmDefault < ActiveRecord::Migration
  def change
    change_column_default :auto_work_spaces, :allow_anonymous, true
    change_column_default :auto_work_spaces, :deny_close, true
  end
end
