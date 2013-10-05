class User < ActiveRecord::Base
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
end
