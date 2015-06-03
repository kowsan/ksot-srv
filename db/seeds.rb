# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Status.create(:name => 'Открыто')
Status.create(:name => 'Выполнено')
Status.create(:name => 'Закрыто')


StaffRole.delete_all
StaffRole.create(:name => 'Пользователь', :can_add_issue => true, :can_edit_issue => true,
                 :can_change_issue_status => true)
StaffRole.create(:name => 'Продвинутый пользователь', :can_add_issue => true, :can_edit_issue => true,
                 :can_change_issue_status => true, :can_shutdown_app => true)
StaffRole.create(:name => 'Руководитель участка', :can_add_issue => true, :can_edit_issue => true,
                 :can_change_issue_status => true,
                 :can_shutdown_app => true,
                 :can_view_issue_report_local => true,
                 :can_view_employees_list => true,
                 :can_view_work_changes_owned => true,
                 :can_fill_control_list => true)
StaffRole.create(:name => 'Инженер по охране труда',
                 :can_add_issue => true, :can_edit_issue => true,
                 :can_change_issue_status => true,
                 :can_shutdown_app => true,
                 :can_view_issue_report_local => true,
                 :can_view_employees_list => true,
                 :can_view_work_changes_owned => true,
                 :can_fill_control_list => true
)




