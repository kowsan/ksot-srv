# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Status.delete_all
Status.create(:name => 'Открыто')
Status.create(:name => 'Выполнено')
Status.create(:name => 'Закрыто')


StaffRole.delete_all
StaffRole.create!(:name => 'Пользователь', :can_add_issue => true, :can_edit_issue => true,
                  :can_change_issue_status => true)
StaffRole.create!(:name => 'Продвинутый пользователь', :can_add_issue => true, :can_edit_issue => true,
                  :can_change_issue_status => true, :can_shutdown_app => true)
StaffRole.create!(:name => 'Руководитель участка', :can_add_issue => true, :can_edit_issue => true,
                  :can_change_issue_status => true,
                  :can_shutdown_app => true,
                  :can_view_issue_report_local => true,
                  :can_view_employees_list => true,
                  :can_view_work_changes_owned => true,
                  :can_fill_control_list => true)
adm_id=StaffRole.create!(:name => 'Инженер по охране труда',
                         :can_add_issue => true, :can_edit_issue => true,
                         :can_change_issue_status => true,
                         :can_shutdown_app => true,
                         :can_view_issue_report_local => true,
                         :can_view_employees_list => true,
                         :can_view_work_changes_owned => true,
                         :can_fill_control_list => true, :can_manage_org_structure => true
)

User.delete_all


Management.create!(:name => 'Южная Дирекция скоростного сообщения!')
# Management.create!(:name => 'Дирекция-2')
Area.create!(:name => 'Участок 1', :management_id => Management.first.id)
Area.create!(:name => 'Участок 2', :management_id => Management.last.id)


Subdivision.create!(:name => 'Подразделение 1', :area_id => Area.first.id)
Subdivision.create!(:name => 'Подразделение 2', :area_id => Area.last.id)

u= User.new(:login => 'admin', :password => 'admin', :last_name => 'Пользователь', :first_name => 'Системный')
u.subdivision_id=Subdivision.first.id
u.staff_role=adm_id
u.save!


CriticalType.create!(:name => 'Желтый', :color => 'yellow')
CriticalType.create!(:name => 'Оранжевый', :color => 'orange')
CriticalType.create!(:name => 'Синий', :color => 'blue')
CriticalType.create!(:name => 'Красный', :color => 'red')
