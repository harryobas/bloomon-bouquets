require "spec_helper"

RSpec.describe Bloomon::Bouquets::BouquetSpecParser do
  describe '#parse_spec' do
    context 'bouquet spec string length is 12' do
      it 'returns a hash of spec attributes' do
        attrs = Bloomon::Bouquets::BouquetSpecParser.parse_spec "AL20a15b5c30"
        expect(attrs).to be_a Hash
      end
    end
    context 'bouquet spec string length 10' do
      it 'returns a hash of spec attributes' do
          attrs = Bloomon::Bouquets::BouquetSpecParser.parse_spec "CL20a15c45"
          expect(attrs).to be_a Hash
      end
    end
  end
end
