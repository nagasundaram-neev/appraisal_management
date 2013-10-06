class Role < ActiveRecord::Base
	
  validates :name, presence: true, uniqueness: true
  has_many :users, through: :role_users
  has_many :role_users
  has_many :departments, through: :department_roles
  has_many :department_roles    

end
