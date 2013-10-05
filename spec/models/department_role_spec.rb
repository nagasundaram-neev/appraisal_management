require 'spec_helper'

describe DepartmentRole do
  it { should belong_to(:department) }
  it { should belong_to(:role) }
end
