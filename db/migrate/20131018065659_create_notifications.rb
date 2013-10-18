class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
    	t.belongs_to :sender, :foreign_key => 'sender_id', :class_name => "User"
      t.string :message
      
      t.timestamps
    end
  end
end
