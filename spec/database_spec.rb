require 'spec_helper'
require 'database'

RSpec.describe Database do
  describe '.discount_for' do
    it 'returns a discount for an item' do
      expect(Database.discount_for(:apple)).to eql('2_for_1')
    end

    context 'when no discount exists' do
      it 'returns nil' do
        expect(Database.discount_for(:orange)).to be(nil)
      end
    end
  end
end
