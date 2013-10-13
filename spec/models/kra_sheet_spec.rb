require 'spec_helper'

describe KraSheet do

	before (:each) do
	  @kra_sheet = FactoryGirl.create(:kra_sheet)
	end
  it { should have_many(:kra_ratings) }
  it { should belong_to(:appraisal_cycle) }
  it { should belong_to(:appraisee) }
  it { should belong_to(:appraiser) }

  it "should appraisee_id unique in kra sheet" do
    @kra_sheet2 = KraSheet.new(:appraisal_cycle_id => 1 , :appraisee_id => 2 , :appraiser_id =>3)
    @kra_sheet2.should_not be_valid
  end

end
