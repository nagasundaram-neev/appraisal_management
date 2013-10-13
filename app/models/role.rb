class Role < ActiveRecord::Base
 
  validates :name, presence: true, uniqueness: true
  
  has_many :role_users
  has_many :users, through: :role_users
  has_many :department_roles  
  has_many :departments, through: :department_roles
  has_many :kra_attrs, through: :kra_role_attrs
  has_many :kra_role_attrs, dependent: :destroy
  

  

  
end
