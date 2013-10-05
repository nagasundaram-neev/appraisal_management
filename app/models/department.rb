class Department < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :department_roles
  has_many :roles, through: :department_roles
  has_many :department_users
  has_many :users, through: :department_users
end
