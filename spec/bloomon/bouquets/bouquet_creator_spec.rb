require "spec_helper"

RSpec.describe Bloomon::Bouquets::BouquetCreator do
  flowers = [
    "aS", "aS", "bL", "rL","tS", "aL", "cL", "sL",
    "cL", "bL", "aS", "aS", "cL", "cL", "cS", "aS", "cS", "aS",
    "aL", "aL", "aL", "aL", "bS", "aS", "aS", "cL", "aL", "aS", "aS", "bS", "cL",
    "aL", "bL", "bL", "aS", "aL", "cL", "aS", "bS", "cS", "cS",
    "bS", "bS", "aL", "aS", "aL", "cL", "bS", "aL", "aS", "bL", "bS",
    "bS", "aS", "aS", "aS", "aS", "bS", "aS", "aL", "bS", "bL",
    "aS", "aS", "aL", "cS", "aL", "aS", "aS", "aS", "bS", "aL", "bS",
    "bL", "bL", "cL", "cL", "aS", "bL", "bS", "bL", "aS", "cS", "cL", "bL", "aL",
    "cL", "bL", "cL", "aL", "aL", "cS", "bS", "aL", "aL", "aL", "aS", "aS", "aS", "cL", "bL", "bS",
    "bL", "bL", "cS", "bL", "aS", "bS", "aS", "bS", "aS", "aL", "cL", "aL"
  ]
  spec_flowers = [
    Bloomon::Bouquets::FlowerSpecification.new(3, 'b'),
    Bloomon::Bouquets::FlowerSpecification.new(5, 'c'),
    Bloomon::Bouquets::FlowerSpecification.new(8, 'a')
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
    context 'all flower specs found in flowers list' do
      spec = Bloomon::Bouquets::BouquetSpecification.new("A", "L", spec_flowers, 20)
      it 'creates a bouquet' do
        bouq_creator = Bloomon::Bouquets::BouquetCreator.new(spec, flowers)
        expect(bouq_creator.create_bouquet).to be_a Bloomon::Bouquets::BouquetModel
        expect(bouq_creator.create_bouquet.flowers_qty.values.reduce(&:+)).to eq spec.flowers.map { |e| e.qty }.reduce(&:+)
      end
    end
    context 'all flower specs not found im flowers list' do
      spec_flowers = [
        Bloomon::Bouquets::FlowerSpecification.new(3, 'f'),
        Bloomon::Bouquets::FlowerSpecification.new(5, 'c'),
        Bloomon::Bouquets::FlowerSpecification.new(8, 'a')
      ]
      spec = Bloomon::Bouquets::BouquetSpecification.new("A", "L", spec_flowers, 20)
      it 'returns nil' do
        bouq_creator = Bloomon::Bouquets::BouquetCreator.new(spec, flowers)
        expect(bouq_creator.create_bouquet).to eq nil 

      end

    end
  end

end
