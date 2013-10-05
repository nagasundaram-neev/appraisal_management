require 'spec_helper'

describe Department do
	before(:each) do
    @deptartment = FactoryGirl.create(:department)
  end
	it { should have_many(:department_roles) }

  it { should have_many(:roles).through(:department_roles) }

end
