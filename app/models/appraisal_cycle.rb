class AppraisalCycle < ActiveRecord::Base
  has_many :kra_sheets
  has_many :dr_sheets
  validates :start_date, :end_date, :presence => true, :uniqueness => true
  validate :end_after_start
  
  def self.find_rating
    @ratings=KraRatings.where(:kra_sheet_id => self.id)
  end

  def create_kra_sheets
    users = User.where("role != 'admin'")
    users.each do |user|
      appraiser_id = nil
      unless user.kra_sheets.last.nil?
        appraiser_id = user.kra_sheets.last.appraiser_id
      end
      user.kra_sheets.build(:appraiser_id => appraiser_id , :appraisal_cycle_id => self.id,:appraisee_status => 0, :appraiser_status => 0).save        
    end
    notification = Notification.new( :message => "New Appraisal is created for you.")
    notification.save
    notification.update_attributes(:sender => User.where(:role => 'admin').first)
    notification.users = users
  end

  def create_dr_sheets
    User.where("role != 'admin'").each do |user|
      appraiser_id = nil
      unless user.dr_sheets.last.nil?
        appraiser_id = user.dr_sheets.last.appraiser_id
      end
        user.dr_sheets.build(:appraiser_id => appraiser_id , :appraisal_cycle_id => self.id,:appraisee_status => 0, :appraiser_status => 0).save
    end
  end

  private

  def end_after_start
    if end_date <= start_date
      errors.add(:end_date, "must be after the start date") 
    end
  end

end
