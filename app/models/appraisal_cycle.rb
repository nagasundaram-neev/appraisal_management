class AppraisalCycle < ActiveRecord::Base
  has_many :kra_sheets
  has_many :dr_sheets
  has_many :longterm_sheets
  validates :start_date, :end_date, :presence => true, :uniqueness => true
  validate :end_after_start
  
  def self.find_rating
    @ratings=KraRatings.where(:kra_sheet_id => self.id)
  end

  def create_kra_sheets
    users_without_kraprsrs = []
    users = User.where("role != 'admin'")
    users.each do |user|
      appraiser_id = nil
      unless user.kra_sheets.last.nil?        
        appraiser_id = user.kra_sheets.last.appraiser_id
      else
        users_without_kraprsrs.push(user)
      end
      user.kra_sheets.build(:appraiser_id => appraiser_id , :appraisal_cycle_id => self.id,:appraisee_status => false, :appraiser_status => false).save        
    end
    Thread.new do
      notification = Notification.new( :message => "New KRA Appraisal is created for you.")
      notification.save
      notification.update_attributes(:sender => User.where(:role => 'admin').first)
      notification.users = users
    end
    return users_without_kraprsrs
  end

  def create_dr_sheets
    users_without_draprsrs = []
    User.where("role != 'admin'").each do |user|
      appraiser_id = nil
      unless user.dr_sheets.last.nil?        
        appraiser_id = user.dr_sheets.last.appraiser_id
      else
        users_without_draprsrs.push(user)
      end
        user.dr_sheets.build(:appraiser_id => appraiser_id , :appraisal_cycle_id => self.id,:appraisee_status => false, :appraiser_status => false).save
        user.longterm_sheets.build(:appraiser_id => appraiser_id, :appraisal_cycle_id => self.id, :appraisee_status => false).save
    end
    Thread.new do
      notification = Notification.new( :message => "New  DR Appraisal is created for you.")
      notification.save
      notification.update_attributes(:sender => User.where(:role => 'admin').first)
      notification.users = users
    end
    return users_without_draprsrs
  end

  private

  def end_after_start
    if end_date <= start_date
      errors.add(:end_date, "must be after the start date") 
    end
  end

end
