class Role < ActiveRecord::Base
	has_many :department_roles
    has_many :deparments, through: :department_roles
end
