class Bloomon::Bouquets::FlowerSpecification
  attr_reader :qty, :specie

  def initialize(qty, specie)
    @qty = qty.to_i
    @specie = specie
  end
end
