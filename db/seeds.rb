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
user_id=StaffRole.create!(:name => 'Пользователь', :can_add_issue => true, :can_edit_issue => true,
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


management_id=Management.create!(:name => 'Южная Дирекция скоростного сообщения!')
# Management.create!(:name => 'Дирекция-2')
Area.create!(:name => 'Участок 1', :management_id => management_id.id)
Area.create!(:name => 'Участок 2', :management_id =>  management_id.id)


Subdivision.create!(:name => 'Подразделение 1', :area_id => Area.first.id)
Subdivision.create!(:name => 'Подразделение 2', :area_id => Area.last.id)

u1= User.new(:login => 'admin', :password => 'admin', :last_name => 'Пользователь', :first_name => 'Системный')
u1.subdivision_id=Subdivision.first.id
u1.staff_role=adm_id
u1.save!

u2= User.new(:login => 'user', :password => 'user', :last_name => 'Обычный', :first_name => 'Пользователь')
u2.subdivision_id=Subdivision.first.id
u2.staff_role=user_id
u2.save!


ct_yellow=CriticalType.create!(:name => 'Желтый', :color => '#FFFF00')
ct_orange=CriticalType.create!(:name => 'Оранжевый', :color => '#FFB570')
ct_blue=CriticalType.create!(:name => 'Синий', :color => '#7EA6E0')
ct_red=CriticalType.create!(:name => 'Красный', :color => '#EA6B66')


it1=IssueType.create!(name: "Вскрыт спецпакет", critical_type_id: ct_yellow.id)


