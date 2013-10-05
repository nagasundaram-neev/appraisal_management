require 'spec_helper'

describe User do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  context 'is invalid' do
    it 'when required #email is not given' do
      @user.email = ''
      should_not be_valid
    end

    it 'when required #password is not given' do
      @user.password = ''
      should_not be_valid
    end

    it 'when required #first_name is not given' do
      @user.first_name = ''
      should_not be_valid
    end
    
    it 'when required #last_name is not given' do
      @user.last_name = " " 
      should_not be_valid
    end
    
    it 'when #email is not unique' do
      @user.save
      @tempuser=User.new(email: 'naga@gmail.com')
      
      @tempuser.should_not be_valid
      @tempuser.errors.full_messages[0].should match 'Email has already been taken'
    end
    it 'when #email format is not valid' do
      @user.email = 'invalid mail'
      should_not be_valid
    end
    
    it 'when #password is not at least 8 characters' do
      @user.password = 'abc123'
      should_not be_valid
    end
    
    it 'when required #phone_no is not given' do
      @user.phone_no = "" 
      should_not be_valid
    end

    it 'when #phone_no format is not valid' do
      @user.phone_no = "abcde"
      should_not be_valid
    end

    it {should ensure_inclusion_of(:gender).in_array(['M', 'F']) }

  end
    # Specs for testing the association

    it { should have_many(:roles).through(:role_users) }
    it { should have_many(:role_users) }

    it { should have_many(:departments).through(:department_users) }
    it { should have_many(:department_users) }

end




