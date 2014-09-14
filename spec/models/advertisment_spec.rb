require 'rails_helper'

RSpec.describe Advertisment, :type => :model do
  context 'advertisment' do
    let(:type) { FactoryGirl.build(:type) }
    let(:user) { FactoryGirl.build(:user) }

    it 'has a valid factory' do
      advertisment = FactoryGirl.build(:advertisment, type: type, user: user)
      expect(advertisment).to be_valid
    end

    it 'is invalid without title' do
      advertisment = FactoryGirl.build(:advertisment, type: type, user: user, title: nil)
      expect(advertisment).not_to be_valid
    end


    it 'is invalid without body' do
      advertisment = FactoryGirl.build(:advertisment, type: type, user: user, body: nil)
      expect(advertisment).not_to be_valid
    end

    it 'is invalid without type' do
      advertisment = FactoryGirl.build(:advertisment, user: user, type: nil)
      expect(advertisment).not_to be_valid
    end
  end
end
