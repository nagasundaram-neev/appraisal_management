# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appraisal_cycle do
  	start_date "2013-03-01"
  	end_date "2013-09-01"
  end
  factory :invalid_appraisal_cycle, class: AppraisalCycle do
   start_date nil
   end_date nil
  end
end
