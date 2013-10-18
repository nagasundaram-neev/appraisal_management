class Notification < ActiveRecord::Base
  has_many :users, through: :user_notifications
  has_many :user_notifications
  belongs_to :sender, :foreign_key => "sender_id", :class_name => "User"
end
