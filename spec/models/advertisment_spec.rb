require 'rails_helper'

RSpec.describe Advertisment, :type => :model do
  context 'advertisment' do
    let(:type) { FactoryGirl.build(:type) }
    let(:user) { FactoryGirl.build(:user) }

    it 'has a valid factory' do
      advertisment = FactoryGirl.build(:advertisment, type: type, user: user)
      expect(advertisment).to be_valid
    end

    context 'when create without title' do
      let(:advertisment) { FactoryGirl.build(:advertisment, type: type, user: user, title: nil) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when create without body' do
      let(:advertisment) { FactoryGirl.build(:advertisment, type: type, user: user, body: nil) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when create without type' do
      let(:advertisment) { FactoryGirl.build(:advertisment, user: user, type: nil)}
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when create without user' do
      let(:advertisment) { FactoryGirl.build(:advertisment, type: type, user: nil)}
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when create without state' do
      let(:advertisment) { FactoryGirl.build(:advertisment, type: type, user: user, state: nil)}
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when title is too long' do
      let(:advertisment) { FactoryGirl.build(:advertisment, type: type, user: user, title: random(31)) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when title is too short' do
      let(:advertisment) { FactoryGirl.build(:advertisment, type: type, user: user, title: random(1)) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when body is too long' do
      let(:advertisment) { FactoryGirl.build(:advertisment, type: type, user: user, body: random(181)) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when body is too short' do
      let(:advertisment) { FactoryGirl.build(:advertisment, type: type, user: user, body: random(1)) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

    context 'when state is too long' do
      let(:advertisment) { FactoryGirl.build(:advertisment, type: type, user: user, state: random(21)) }
      it 'should not be valid' do
        expect(advertisment).not_to be_valid
      end
    end

  end

  def random(length)
    SecureRandom.hex(length)
  end
end
