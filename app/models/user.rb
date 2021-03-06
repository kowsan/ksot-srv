class User < ActiveRecord::Base
  belongs_to :staff_role
  belongs_to :subdivision

  has_many :issues
  default_scope { where(:is_active => true) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable
  validates_presence_of :login, :first_name, :last_name, :staff_role_id, :subdivision_id
  def full_name
    "#{self.last_name} #{self.first_name} "
  end

  def area
    subdivision.area
  end
  def to_s
    "#{self.first_name} #{self.last_name} #{self.subdivision.name}"
  end
end
