class User < ActiveRecord::Base
  
  has_many :roles, through: :role_users
  has_many :role_users
  
  has_many :departments, through: :department_users
  has_many :department_users

  has_many :kra_sheets, :foreign_key => "appraisee_id", :class_name => "KraSheet"
  has_many :appraiser_kra_sheets, :foreign_key => "appraiser_id", :class_name => "KraSheet"
  has_many :dr_sheets, :foreign_key => "appraisee_id", :class_name => "DrSheet"
  has_many :appraiser_dr_sheets, :foreign_key => "appraiser_id", :class_name => "DrSheet"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,message: 'The format of Email is invalid'}
  validates :password, presence: true, length: { minimum: 8 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_no, presence: true, format: {with: /\A(([+][9][1])(\d{10}))\Z/, message: 'The format of Phone number is invalid'}
  validates_inclusion_of :gender, in: %w(M F)

  def self.appraiser_list(appraisee)
    (User.where(:role => "appraiser") - [appraisee])
  end
end
