require 'rails_helper'

RSpec.describe 'Api::V1::Auths' do
  describe 'POST /api/v1/auth' do
    subject(:request) { post user_registration_path(body) }

    let(:body) do
      {
        name: 'Jane Doe',
        email: 'janedoe@mail.com',
        password: 'fake-password'
      }
    end

    describe 'when single user' do
      before { request }

      context 'when body is nil' do
        let(:body) { nil }

        it { expect(response).to have_http_status(:unprocessable_entity) }
      end

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when user is already registered' do
      before do
        create(:user)
        request
      end

      it { expect(response).to have_http_status(:forbidden) }
      it { expect(User.count).to be(1) }
    end
  end
end
