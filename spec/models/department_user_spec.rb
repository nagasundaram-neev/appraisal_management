require 'spec_helper'

describe DepartmentUser do
  it { should belong_to(:user) }
  it { should belong_to(:department) }
end
