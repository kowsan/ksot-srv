class ExclusionDay < ActiveRecord::Base
  belongs_to :turn_type
  belongs_to :turn_scheme
end
