require 'bloomon/bouquets/bouquet_model'

class Bloomon::Bouquets::BouquetCreator
  def initialize (spec, flowers)
    @spec = spec
    @flowers = flowers
  end

  def create_bouquet
    bouquet_name = @spec.name
    bouquet_size = @spec.size
    spec_flowers = @spec.flowers
    bouquet_flowers = []
    bouquets_total = @spec.total
    bouquet = Bloomon::Bouquets::BouquetModel.new(bouquet_name, bouquet_size, bouquet_flowers, bouquet_total)
  end 

end
