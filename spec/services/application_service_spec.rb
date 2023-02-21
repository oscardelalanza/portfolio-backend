require 'rails_helper'

describe ApplicationService do
  describe '#call' do
    it { expect { described_class.new.call }.to raise_error(NotImplementedError) }
  end

  describe '.call' do
    it { expect { described_class.call }.to raise_error(NotImplementedError) }
  end
end
