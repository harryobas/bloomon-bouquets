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
    context 'bouquet spec string length is 9' do
      it 'returns a hash of spec attributes' do
        attrs = Bloomon::Bouquets::BouquetSpecParser.parse_spec "BS10b5c16"
        expect(attrs).to be_a Hash
      end
    end
    context 'bouquet spec string length is 7' do
      it 'returns a hash of spec attributes' do
        attrs = Bloomon::Bouquets::BouquetSpecParser.parse_spec "DL20b28"
        expect(attrs).to be_a Hash
      end
    end
    context 'when unable to parse bouquet spec string' do
      it 'should return nothing' do
        expect(Bloomon::Bouquets::BouquetSpecParser.parse_spec "AL10a15b5c30").to eq nil
      end
    end
  end
end
