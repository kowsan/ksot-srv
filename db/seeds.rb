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


management_id=Management.create!(:name => 'Южная Дирекция скоростного сообщения')
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
it2=IssueType.create!(name: 'Не явка на рабочее место в срок',critical_type_id: ct_yellow.id)
it3=IssueType.create!(name: 'Опоздание с обеда',critical_type_id: ct_yellow.id)
it4=IssueType.create!(name: 'Покинул пост без уважительной причины',critical_type_id: ct_red.id)
it5=IssueType.create!(name: 'Нарушение правил, обеспечивающих безопасность движения на железнодорожном транспорте',
                      critical_type_id: ct_yellow.id)
it6=IssueType.create!(name: 'Повреждение железнодорожного пути, защитных лесонасаждений, снегозащитных ограждений и других путевых объектов, сооружений и устройств сигнализации и связи',
                      critical_type_id: ct_yellow.id)

it7=IssueType.create!(name: 'Проход по железнодорожным путям в неустановленных местах',
                      critical_type_id: ct_yellow.id)
it8=IssueType.create!(name: 'Подкладывание на железнодорожные пути предметов, которые могут вызвать нарушение движения поездов',
                      critical_type_id: ct_yellow.id)
it9=IssueType.create!(name: 'Несоблюдение установленных габаритов при погрузке и выгрузке грузов',
                      critical_type_id: ct_yellow.id)

system_ws=WorkSpace.create!(:name=> 'Системное',:short_name=> 'sys',:subdivision_id=>Subdivision.first.id)
system_ws.issue_types=IssueType.all
system_ws.save!


