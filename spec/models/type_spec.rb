require 'rails_helper'

RSpec.describe Type, :type => :model do

  it 'has a valid factory' do
    type = FactoryGirl.create(:type)
    expect(type).to be_valid
  end

  context 'when create without name' do
    let(:type) { FactoryGirl.build(:type, name: nil) }
    it 'should not be valid' do
      expect(type).not_to be_valid
    end
  end

  context 'when name is too long' do
    let(:type) { FactoryGirl.build(:type, name: SecureRandom.hex(25)) }
    it 'should not be valid' do
      expect(type).not_to be_valid
    end
  end
end
