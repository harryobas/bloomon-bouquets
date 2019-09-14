require "spec_helper"

RSpec.describe Bloomon::Bouquets::BouquetCreator do
  flowers = ["aS", "aS", "bL", "rL","tS"]
  spec_flowers = [
    Bloomon::Bouquets::FlowerSpecification.new(3, 'r'),
    Bloomon::Bouquets::FlowerSpecification.new(5, 'c'),
    Bloomon::Bouquets::FlowerSpecification.new(8, 's')
  ]
  context 'initialization' do
    spec = Bloomon::Bouquets::BouquetSpecification.new("A", "L", spec_flowers, 20)
    it 'initializes with a bouquet spec and a list of flowers' do
      bouq_creator = Bloomon::Bouquets::BouquetCreator.new(spec, flowers)
      expect(bouq_creator).not_to eq nil
      expect(bouq_creator).to be_a Bloomon::Bouquets::BouquetCreator
    end
  end
  describe '#create_bouquet' do
    spec = Bloomon::Bouquets::BouquetSpecification.new("A", "L", spec_flowers, 20)
    it 'creates a bouquet' do
      bouq_creator = Bloomon::Bouquets::BouquetCreator.new(spec, flowers)
      expect(bouq_creator.create_bouquet).to be_a Bloomon::Bouquets::BouquetModel
    end
    it 'creates a bouquet with flowers' do
      bouq_creator = Bloomon::Bouquets::BouquetCreator.new(spec, flowers)
      bouquet = bouq_creator.create_bouquet
      expect(bouquet.flowers.count).not_to eq 0
    end
  end

end
