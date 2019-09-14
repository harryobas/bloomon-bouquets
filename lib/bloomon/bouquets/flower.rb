class Bloomon::Bouquets::Flower
  attr_reader :qty, :specie

  def initialize(qty, specie)
    @qty = qty
    @specie = specie
  end
end
