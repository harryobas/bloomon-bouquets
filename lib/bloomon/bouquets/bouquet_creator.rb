require 'bloomon/bouquets/bouquet_model'

class Bloomon::Bouquets::BouquetCreator
  def initialize (spec, flowers)
    if spec.nil?
      raise StandardError.new 'bouquet specification not found.'
    end
    @spec = spec
    @flowers = flowers
  end

  def create_bouquet
    bouquet_name = @spec.bouquet_name
    bouquet_size = @spec.bouquet_size
    spec_flowers = @spec.flowers
    bouquet_flowers = []
    bouquets_total = @spec.total
    bouquet = Bloomon::Bouquets::BouquetModel.new(bouquet_name, bouquet_size, bouquet_flowers, bouquets_total)

    populate_bouquet_with_flowers(bouquet, spec_flowers, @flowers)

  end

  private

  def populate_bouquet_with_flowers(bouq, spec_f, flowers)
    spec_f.each do |sf|
      sf.qty.times do
        flowers.each do |f|
          bouq.flowers << Bloomon::Bouquets::Flower.new(f[0]) if f[0] == sf.specie && f[1] == bouq.size
          bouq.flowers_qty[f[0]] =+ 1
         end
      end
    end
    bouq
  end

end
