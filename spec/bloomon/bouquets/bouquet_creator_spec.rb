require "spec_helper"

RSpec.describe Bloomon::Bouquets::BouquetCreator do
  context 'initialization' do
    flowers = [
      Bloomon::Bouquets::Flower.new(3, 'r'),
      Bloomon::Bouquets::Flower.new(5, 'c'),
      Bloomon::Bouquets::Flower.new(8, 's'),
      Bloomon::Bouquets::Flower.new(2, 'z'),
      Bloomon::Bouquets::Flower.new(4, 'p'),
      Bloomon::Bouquets::Flower.new(7, 'a')
    ]
    spec_flowers = [
      Bloomon::Bouquets::Flower.new(3, 'r'),
      Bloomon::Bouquets::Flower.new(5, 'c'),
      Bloomon::Bouquets::Flower.new(8, 's')
    ]
    spec = Bloomon::Bouquets::BouquetSpecification.new("A", "L", spec_flowers, 20)
    it 'initializes with a bouquet spec and a list of flowers' do
      bouq_creator = Bloomon::Bouquets::BouquetCreator.new(spec, flowers)
      expect(bouq_creator).not_to eq nil
      expect(bouq_creator).to be_a Bloomon::Bouquets::BouquetCreator
    end
    it 'raises error when spec is nil' do
      expect(Bloomon::Bouquets::BouquetCreator.new(nil, flowers)).to raise_error(StandardError)
    end
      
  end

end
