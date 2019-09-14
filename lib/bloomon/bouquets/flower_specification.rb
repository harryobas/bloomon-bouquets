class Bloomon::Bouquets::FlowerSpecification
  attr_reader :qty, :specie

  def initialize(qty, specie)
    @qty = qty
    @specie = specie
  end
end
