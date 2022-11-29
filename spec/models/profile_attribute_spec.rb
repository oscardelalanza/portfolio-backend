require 'rails_helper'

RSpec.describe ProfileAttribute do
  let(:valid_attributes) { attributes_for(:profile_attribute) }

  describe 'attributes validations' do
    subject { described_class.new(attributes) }

    describe 'key' do
      context 'when is not present' do
        let(:attributes) { valid_attributes.merge(key: nil) }

        it { is_expected.not_to be_valid }
      end

      context 'when is longer' do
        let(:attributes) { valid_attributes.merge(key: 'a' * 21) }

        it { is_expected.not_to be_valid }
      end

      context 'when is not a word' do
        let(:attributes) { valid_attributes.merge(key: 'value*ads') }

        it { is_expected.not_to be_valid }
      end
    end

    describe 'value' do
      context 'when is not present' do
        let(:attributes) { valid_attributes.merge(value: nil) }

        it { is_expected.not_to be_valid }
      end
    end

    describe 'description' do
      context 'when is longer' do
        let(:attributes) { valid_attributes.merge(description: 'a' * 256) }

        it { is_expected.not_to be_valid }
      end
    end

    describe 'visible' do
      context 'when is not present' do
        let(:attributes) { valid_attributes.merge(visible: nil) }

        it { is_expected.not_to be_valid }
      end
    end
  end

  describe '#visible?' do
    subject { described_class.new(attributes).visible? }

    context 'when is visible' do
      let(:attributes) { valid_attributes.merge(visible: true) }

      it { is_expected.to be_truthy }
    end

    context 'when is not visible' do
      let(:attributes) { valid_attributes.merge(visible: false) }

      it { is_expected.to be_falsey }
    end
  end
end
