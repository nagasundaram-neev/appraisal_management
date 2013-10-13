require 'spec_helper'

describe KraRatingsController do

	include Devise::TestHelpers

	before (:each) do
	  @admin = FactoryGirl.create(:admin)
	  sign_in @admin
	  @kra_rating = FactoryGirl.create(:kra_rating)
	end

end
