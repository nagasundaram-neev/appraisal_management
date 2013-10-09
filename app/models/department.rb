class Department < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :roles, through: :department_roles, dependent: :destroy
  has_many :department_roles
  has_many :users, through: :department_users
  has_many :department_users
  
  def save_dept_user(user_id,dept_id)
  User.find(user_id).department_users.build(:department_id => dept_id).save 
  end
end
