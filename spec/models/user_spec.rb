require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'has a valid factory' do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  context 'when register without email' do
    it {
      user = FactoryGirl.build(:user, email: nil)
      expect(user).not_to be_valid
    }
  end

  context 'when register without password' do
    it {
      user = FactoryGirl.build(:user, password: nil)
      expect(user).not_to be_valid
    }
  end

  context 'when role is blank' do
    it {
      user = FactoryGirl.build(:user, role: nil)
      expect(user).not_to be_valid
    }
  end

  context 'when email is repeated' do
    it {
      FactoryGirl.create(:user)
      user = FactoryGirl.build(:user)
      expect(user).not_to be_valid
    }
  end

end
