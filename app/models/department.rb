class Department < ActiveRecord::Base
	has_many :department_roles
    has_many :roles, through: :department_roles
    validates :name, presence: true, uniqueness: true
end
