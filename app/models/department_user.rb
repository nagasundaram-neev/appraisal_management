class DepartmentUser < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  belongs_to :department
  validates_presence_of :department_id
end
