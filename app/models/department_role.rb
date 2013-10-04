class DepartmentRole < ActiveRecord::Base
	belongs_to :department
  belongs_to :role
end
