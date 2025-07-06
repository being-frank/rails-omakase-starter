require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  describe '.human_name' do
    context 'when default' do
      it { expect(described_class.human_name).to eq('Application records') }
    end

    context 'when singular' do
      it { expect(described_class.human_name(plural: false)).to eq('Application record') }
    end
  end
end
