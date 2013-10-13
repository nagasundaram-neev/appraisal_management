require 'spec_helper'

describe KraRoleAttr do

  it { should belong_to(:kra_attr) }
  it { should belong_to(:role) }
  
end

