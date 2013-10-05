require 'spec_helper'

describe RoleUser do
  it { should belong_to(:user) }
  it { should belong_to(:role) }
end
