class Role < ActiveRecord::Base
	
  validates :name, presence: true, uniqueness: true
  has_many :users, through: :role_users
  has_many :role_users
  has_many :departments, through: :department_roles
  has_many :department_roles
  has_many :kra_attrs, through: :kra_role_attrs
  has_many :kra_role_attrs, dependent: :destroy

  def save_kr_role_attr(id)
    @kra_role_attr = self.kra_role_attrs.build(:kra_attr_id => id)
    @kra_role_attr.save
  end

end
