require 'spec_helper'
require 'pricing_service'

RSpec.describe PricingService do
  let(:service) do
    described_class.new(
      discount: discount,
      price: price,
      count: count,
    )
  end
  let(:discount) {}
  let(:price) { 20 }
  let(:count) { 2 }
  let(:no_discount) { price * count }

  describe '#calculate' do
    subject { service.calculate }

    context 'when no discount is provided' do
      it 'returns the price with no discounts applied' do
        expect(subject).to eql(no_discount)
      end
    end

    context 'when a 2 for 1 discount is provided' do
      let(:discount) { '2_for_1' }

      it 'applies the 2_for_1 discount' do
        expect(subject).to eql(20)
      end

      context 'but only 1 item is provided' do
        let(:count) { 1 }

        it 'returns the price of a single item' do
          expect(subject).to eql(20)
        end
      end
    end

    context 'when a half price discount is provided' do
      let(:discount) { 'half_price' }

      it 'applies the half_price discount' do
        expect(subject).to eql(20)
      end

      context 'when the price doesnt divide cleanly' do
        let(:price) { 15 }

        it 'still applies the discount' do
          expect(subject).to eql(15)
        end
      end
    end

    context 'when a single half price item discount is applied' do
      let(:discount) { '1_half_price' }

      it 'applies the single half price discount' do
        expect(subject).to eql(30.0)
      end

      context 'when the price doesnt divide cleanly' do
        let(:price) { 15 }

        it 'still applies the discount' do
          expect(subject).to eql(22.5)
        end
      end
    end
  end
end
