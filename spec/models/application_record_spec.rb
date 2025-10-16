require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  describe '.human_name' do
    context 'when default' do
      it { expect(described_class.human_name).to eq('Application record') }
    end

    context 'when plural' do
      it { expect(described_class.human_name(true)).to eq('Application records') }
    end
  end
end
