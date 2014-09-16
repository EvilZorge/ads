require 'rails_helper'

RSpec.describe Advertisment, :type => :model do
  let(:type) { FactoryGirl.create(:type) }
  let(:user) { FactoryGirl.create(:user) }

  context 'Advertisment' do

    let(:advertisment) { FactoryGirl.build(:advertisment, type: type, user: user) }

    it 'has a valid factory' do
      advertisment = FactoryGirl.build(:advertisment, type: type, user: user)
      expect(advertisment).to be_valid
    end

    context 'when create without title' do
      before { advertisment.title = nil }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when create without body' do
      before { advertisment.body = nil }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when create without type' do
      before { advertisment.type = nil }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when create without user' do
      before { advertisment.user = nil }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when create without state' do
      before { advertisment.state = nil }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when title is too long' do
      before { advertisment.title = random(31) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when title is too short' do
      before { advertisment.title = random(1) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when body is too long' do
      before { advertisment.body = random(181) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when body is too short' do
      before { advertisment.body = random(1) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

  end

  def random(length)
    SecureRandom.hex(length)
  end
end
