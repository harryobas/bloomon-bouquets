class Bloomon::Bouquets::BouquetSpecification
  attr_reader :baquet_name, :banquet_size, :flowers, :total

  def initialize(baquet_name, banquet_size, flowers, total)
    @baquet_name = baquet_name
    @banquet_size = banquet_size
    @flowers = flowers
    @total = total
  end

end
