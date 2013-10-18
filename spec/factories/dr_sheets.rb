# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

	factory :dr_sheet1, class: DrSheet do
    appraisee_status 0
    appraiser_status 0
  end

	factory :dr_sheet2, class: DrSheet do
    appraisee_status 1
    appraiser_status 0
  end

  factory :dr_sheet do
  	appraisal_cycle_id 1
    appraisee_id 1
    appraiser_id 3
  end
end
