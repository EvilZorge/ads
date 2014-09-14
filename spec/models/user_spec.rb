require 'rails_helper'

RSpec.describe User, :type => :model do


  it 'has a valid factory' do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  context 'when register without email' do
    let(:user) { FactoryGirl.build(:user, email: nil) }
    it 'should not be valid' do
      expect(user).not_to be_valid
    end
  end

  context 'when register without password' do
    let(:user) { FactoryGirl.build(:user, password: nil) }
    it 'should not be valid' do
      expect(user).not_to be_valid
    end
  end

  context 'when role is blank' do
    let(:user) { FactoryGirl.build(:user, role: nil) }
    it 'should not be valid' do
      expect(user).not_to be_valid
    end
  end

  context 'when email is repeated' do
    let(:user) { FactoryGirl.build(:user)}
    it 'should not be valid' do
      FactoryGirl.create(:user)
      expect(user).not_to be_valid
    end
  end

end
