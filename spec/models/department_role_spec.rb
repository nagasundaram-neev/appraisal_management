require 'spec_helper'

describe DepartmentRole do
	before(:each) do
    @deptartment = FactoryGirl.create(:department)
  end
	
	it { should belong_to(:role) }
	it { should belong_to(:department) }  

end
