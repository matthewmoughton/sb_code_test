require 'spec_helper'
require 'item'
require 'database'

RSpec.describe Item do
  let(:item) { described_class.new(name) }
  let(:name) { 'apple' }

  describe '#discount' do
    subject { item.discount }

    it 'fetches the discount from the database' do
      expect(Database).to receive(:discount_for).with(name)

      subject
    end
  end
end
