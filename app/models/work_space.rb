class WorkSpace < ActiveRecord::Base
  belongs_to :auto_work_space
  belongs_to :subdivision
end
