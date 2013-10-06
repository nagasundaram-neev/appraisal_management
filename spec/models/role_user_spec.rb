require 'spec_helper'

describe RoleUser do
  it { should belong_to(:user) }
  it { should belong_to(:role) }
  it { should belong_to(:appraisal_cycles)}
end
