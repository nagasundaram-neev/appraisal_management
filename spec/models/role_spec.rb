require 'spec_helper'

describe Role do
  it { should have_many(:users).through(:role_users) }
  it { should have_many(:role_users) }
end
