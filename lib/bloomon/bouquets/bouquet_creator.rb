require 'bloomon/bouquets/bouquet_model'

class Bloomon::Bouquets::BouquetCreator
  def initialize (spec, flowers)
    @spec = spec
    @flowers = flowers
  end

  def create_bouquet
    bouquet_name = @spec.bouquet_name
    bouquet_size = @spec.bouquet_size
    spec_flowers = @spec.flowers
    bouquet_flowers = []
    bouquets_total = @spec.total
    bouquet = Bloomon::Bouquets::BouquetModel.new(bouquet_name, bouquet_size, spec_flowers, bouquet_flowers, bouquets_total)

    populate_bouquet_flowers(bouquet,  @flowers)

  end

  private

  def populate_bouquet_flowers(bouq, flowers)
    bouq.flowers_spec.each do |sf|
      if flowers.include? "#{sf.specie}#{bouq.size}" and flowers.count("#{sf.specie}#{bouq.size}") >= sf.qty
        bouq_flowers = flowers.select{|f| f == "#{sf.specie}#{bouq.size}" }.take(sf.qty)
        bouq.flowers_qty[sf.specie] =+ sf.qty

        bouq_flowers.each do |f|
          bouq.add_flower Bloomon::Bouquets::Flower.new(f[0])
        end
      end

    end

    return bouq if bouquet_is_complete?(bouq)
    generate_complete_bouquet(bouq, flowers)

  end

  def bouquet_is_complete?(bouquet)
    bouquet.flowers_qty.values.reduce(&:+) == bouquet.total
  end

  def generate_complete_bouquet(bouquet, flowers)
    out_standing_flowers = bouquet.total - bouquet.flowers_qty.values.reduce(&:+)
    additional_flowers = flowers.take(80).shuffle.select{|f| f[1] == bouquet.size}.take(out_standing_flowers)

    additional_flowers.each do |af|
      bouquet.add_flower Bloomon::Bouquets::Flower.new(af[0])
    end

    bouquet 

  end

end
