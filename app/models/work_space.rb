class WorkSpace < ActiveRecord::Base
  include Blockable
  has_and_belongs_to_many :auto_work_spaces, :unscoped => true
  belongs_to :subdivision
  has_and_belongs_to_many :issue_types
  belongs_to :turn_scheme

  validates_presence_of :name, :message => 'Наименование должно быть задано'
  validates_presence_of :subdivision_id, :message => 'Подразделение должно быть задано'
  validates_presence_of :turn_scheme_id, :message => 'Схема смен  должна быть задана'

  def display_name
    self.name
  end

  default_scope { where(:is_active => true).order('name asc') }
  after_save :drop_redis_cache
end
