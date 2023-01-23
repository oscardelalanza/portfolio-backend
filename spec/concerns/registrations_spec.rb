require 'rails_helper'

RSpec.describe Registrations do
  let(:klass) { Api::V1::Admin::Auth::RegistrationsController }
  let!(:object) { klass.new }

  describe '.registrable' do
    subject { object.send(:users_limit_reached?) }

    context 'when no users in database' do
      it { is_expected.to be_falsey }
    end

    context 'with users in database' do
      before { create(:user) }

      it { is_expected.to be_truthy }
    end
  end

  describe '.register_allowed?' do
    subject { object.send(:register_allowed?) }

    before do
      allow(klass).to receive(:render_error).and_return(:forbidden)
    end

    context 'when no users in databse' do
      it { is_expected.to be_falsey }
    end

    context 'with users in database' do
      before { create(:user) }

      it { is_expected.to be(:forbidden) }
    end
  end
end
