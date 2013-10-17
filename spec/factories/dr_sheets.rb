# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dr_sheet do
  	appraisal_cycle_id 1
    dr_appraisee_id 1
    dr_appraiser_id 3
  end
end
