class WorkSpace < ActiveRecord::Base
  has_many :auto_work_spaces
  belongs_to :subdivision
  has_and_belongs_to_many :issue_types

  validates_presence_of :name, :message => 'Наименование должно быть задано'
  validates_presence_of :subdivision_id, :message => 'Подразделение должно быть задано'


end
