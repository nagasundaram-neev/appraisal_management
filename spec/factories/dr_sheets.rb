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
end
