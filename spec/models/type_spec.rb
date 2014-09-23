require 'rails_helper'

RSpec.describe Type, :type => :model do

  let(:type) { FactoryGirl.build(:type) }

  it 'has a valid factory' do
    type = FactoryGirl.create(:type)
    expect(type).to be_valid
  end

  context 'when create without name' do
    before { type.name = nil }
    it 'should not be valid' do
      expect(type).not_to be_valid
    end
  end

  context 'when name is too long' do
    before { type.name = random(31) }
    it 'should not be valid' do
      expect(type).not_to be_valid
    end
  end

  def random(length)
    SecureRandom.hex(length)
  end
end
