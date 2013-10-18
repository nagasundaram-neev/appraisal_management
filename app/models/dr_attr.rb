class DrAttr < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
  validates :weightage, presence: true, :inclusion => 1..99
  validates :desc, presence:true

  def name_and_weightage
    "#{self.weightage}%: #{self.name} "
  end

  def total_weightage
    total =0
    DrAttr.all.each do |dr_attr|
      total += dr_attr.weightage
    end
    total += self.weightage
    if total>100
      return false
    else return true
  end
  end
end

