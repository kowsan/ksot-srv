class WorkSpace < ActiveRecord::Base
 # has_many :auto_work_spaces
  has_and_belongs_to_many :auto_work_spaces
  belongs_to :subdivision
  has_and_belongs_to_many :issue_types
  belongs_to :turn_scheme

  validates_presence_of :name, :message => 'Наименование должно быть задано'
  validates_presence_of :subdivision_id, :message => 'Подразделение должно быть задано'
  def display_name
    self.name
  end
  default_scope {where(:is_used => true)}
   after_save :drop_redis_cache
end
