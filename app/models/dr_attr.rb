class DrAttr < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
  validates :weightage, presence: true, :inclusion => 1..99
  validates :desc, presence:true

  def name_and_weightage
    "#{self.weightage}%: #{self.name} "
  end

end
	