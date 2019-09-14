class Bloomon::Bouquets::BouquetSpecification
  attr_accessor :bouquet_name, :bouquet_size, :flowers, :total

  def initialize(bouquet_name, bouquet_size, flowers, total)
    @bouquet_name = bouquet_name
    @bouquet_size = bouquet_size
    @flowers = flowers
    @total = total
  end

end
