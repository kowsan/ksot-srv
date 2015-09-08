class ControlListFactor < ActiveRecord::Base
  belongs_to :control_list_factor_group
  validates_presence_of :control_list_factor_group_id ,:factor,:message => 'не может быть пустым'
  validates_uniqueness_of :order_num, :message => 'порядок сортировки уже имеется в системе'

  before_save :maxify
  private
  def maxify
    if self.order_num.to_i==0
      self.order_num=ControlListFactor.maximum(:order_num)+1
    end
  end

end
