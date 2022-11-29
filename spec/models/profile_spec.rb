require 'rails_helper'

RSpec.describe Profile do
  let(:valid_attributes) { attributes_for(:profile) }

  describe 'attributes validations' do
    subject { described_class.new(attributes) }

    describe 'title' do
      context 'when is not present' do
        let(:attributes) { valid_attributes.merge(title: nil) }

        it { is_expected.not_to be_valid }
      end

      context 'when is longer' do
        let(:attributes) { valid_attributes.merge(title: 'a' * 51) }

        it { is_expected.not_to be_valid }
      end
    end

    describe 'description' do
      context 'when is longer' do
        let(:attributes) { valid_attributes.merge(description: 'a' * 256) }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
