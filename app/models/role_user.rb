class RoleUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :appraisal_cycle
  belongs_to :role
  validates_presence_of :user_id
  validates_presence_of :role_id
  validates_presence_of :appraisal_cycles_id
  validates_uniqueness_of :appraisal_cycles_id, scope: [:user_id, :role_id]

end
