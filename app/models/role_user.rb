class RoleUser < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  belongs_to :role
  validates_presence_of :role_id
  belongs_to :appraisal_cycle
  validates_presence_of :appraisal_cycles_id
end
