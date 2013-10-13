require 'spec_helper'

describe AppraisalCycle do

	before(:each) do
    @appraisal_cycle = FactoryGirl.create(:appraisal_cycle)
  end

  context "When #end_date is before or on #start_date" do
		it "should_not allow_value when #end_date before #start_date" do
			  	@appraisal_cycle.start_date = "2013-08-01"
			  	@appraisal_cycle.end_date = @appraisal_cycle.start_date - 1.day 
		end
	end
	
end
