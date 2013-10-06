class RoleUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :appraisal_cycles
end
