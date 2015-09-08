class ControlListFactorGroup < ActiveRecord::Base
  has_many :control_list_factors
  validates_uniqueness_of :order_num,:message => 'порядок сортировки уже имеется в системе'
  validates_presence_of :name,:message => 'не может быть пустым'
  default_scope {order('order_num asc')}


  before_save :maxify
  private
  def maxify
    if self.order_num.to_i==0
      self.order_num=ControlListFactorGroup.maximum(:order_num)+1
    end
  end
end
