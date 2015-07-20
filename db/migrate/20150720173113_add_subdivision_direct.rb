class AddSubdivisionDirect < ActiveRecord::Migration
  def up
    subdivision_manager=StaffRole.create!(:name => 'Руководитель подразделения',
                                          :can_add_issue => true,
                                          :can_edit_issue => true,
                                          :can_change_issue_status => true,
                                          :can_shutdown_app => true,
                                          :can_view_issue_report_local => true,
                                          :can_view_employees_list => true,
                                          :can_view_work_changes_owned => true,
                                          :can_fill_control_list => true,
                                          :can_manage_org_structure => false
    )
  end


  def down
    StaffRole.find_by_name('Руководитель подразделения').destroy_all
  end
end
