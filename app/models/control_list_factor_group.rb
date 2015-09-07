class ControlListFactorGroup < ActiveRecord::Base
  has_many :control_list_factors
  validates_uniqueness_of :order_num,:message => 'порядок сортировки уже имеется в системе'
  validates_presence_of :name,:message => 'не может быть пустым'
  default_scope {order('order_num asc')}
end
