require 'rails_helper'

describe Ufra::Base do
  before do
    stub_request(:get, 'https://ufra.com.mx/categorias/perfumes.html')
  end

  let(:object) { described_class.new }

  describe '#connector' do
    subject { object.connector(path).status }

    let(:path) { '/categorias/perfumes.html' }

    it { is_expected.to be(200) }
  end

  describe '#url' do
    subject { object.send(:url, '/products') }

    it { is_expected.to be_a URI }
    it { is_expected.to eq URI.parse('https://ufra.com.mx/products') }
  end
end
