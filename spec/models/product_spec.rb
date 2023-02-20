require 'rails_helper'

RSpec.describe Product do
  subject { described_class.new(attributes) }

  let(:attributes) { build(:product).attributes }

  describe 'validations' do
    context 'when name is invalid' do
      let(:attributes) { build(:product).attributes.merge(name: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'when brand is invalid' do
      let(:attributes) { build(:product).attributes.merge(brand: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'when content is invalid' do
      context 'when is null' do
        let(:attributes) { build(:product).attributes.merge(content: nil) }

        it { is_expected.not_to be_valid }
      end

      context 'when is a string' do
        let(:attributes) { build(:product).attributes.merge(content: '100s') }

        it { is_expected.not_to be_valid }
      end
    end

    context 'when units is invalid' do
      let(:attributes) { build(:product).attributes.merge(units: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'when category is invalid' do
      let(:attributes) { build(:product).attributes.merge(category: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'when sku is invalid' do
      before { create(:product, sku: '123456') }

      let(:attributes) { build(:product).attributes.merge(sku: '123456') }

      it { is_expected.not_to be_valid }
    end

    context 'when asin is invalid' do
      before { create(:product, asin: 'asd2fda') }

      let(:attributes) { build(:product).attributes.merge(asin: 'asd2fda') }

      it { is_expected.not_to be_valid }
    end

    context 'when all attributes are valid' do
      it { is_expected.to be_valid }
    end
  end
end
