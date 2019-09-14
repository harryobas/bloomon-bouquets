class Bloomon::Bouquets::BouquetModel
  attr_accessor :name, :size, :flowers, :flowers_qty

  def initialize(name, size, flowers, total)
    @name = name
    @size = size
    @flowers = flowers
    @total = total
    @flowers_qty = {}
    @flowers.each{ |f| @flowers_qty[f.specie] = 0}
  end

end
