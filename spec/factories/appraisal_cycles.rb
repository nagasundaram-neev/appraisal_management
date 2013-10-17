# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :appraisal_cycle, class: AppraisalCycle do
    start_date "2013-01-01"
    end_date "2013-05-30"
  end
  factory :appraisal_cycle6, class: AppraisalCycle do
  	start_date "2015-01-01"
  	end_date "2015-05-30"
  end
  factory :invalid_appraisal_cycle, class: AppraisalCycle do
   start_date nil
   end_date nil
  end
end
