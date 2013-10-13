require 'spec_helper'

describe KraRating do

  it { should belong_to(:kra_attr) }
  it { should belong_to(:kra_sheet) }

  before (:each) do
	  @kra_rating = FactoryGirl.create(:kra_rating)
	  @kra_rating_by_manager = FactoryGirl.create(:kra_rating_by_manager)
	end

	it "should unique kra sheet id belongs to attribute and rated by " do
    @kra_rating2 = KraRating.new(:kra_sheet_id => 1 , :kra_attr_id  => 2 , :rating =>4,:comment=> "well done", :rated_by => 0)
    @kra_rating2.should_not be_valid
  end

  it "should unique kra sheet id belongs to attribute and rated by " do
    @kra_rating2 = KraRating.new(:kra_sheet_id => 1 , :kra_attr_id  => 2 , :rating =>4,:comment=> "well done", :rated_by => 1)
    @kra_rating2.should_not be_valid
  end

end
