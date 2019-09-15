class Bloomon::Bouquets::BouquetModel
  attr_accessor :name, :size, :flowers, :flowers_qty, :flowers_spec, :total

  def initialize(name, size,flowers_spec, flowers, total)
    @name = name
    @size = size
    @flowers = flowers
    @flowers_spec = flowers_spec
    @total = total
    @flowers_qty = {}
    @flowers_spec.each{ |f| @flowers_qty[f.specie] = 0}
  end

  def add_flower(flower)
    flowers.push flower
  end


end
