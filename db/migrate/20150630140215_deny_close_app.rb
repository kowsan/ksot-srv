class DenyCloseApp < ActiveRecord::Migration
  def change
    add_column :auto_work_spaces,:deny_close,:boolean,:default => false
  end
end
