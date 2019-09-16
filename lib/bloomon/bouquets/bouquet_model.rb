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

  def to_s
    f = self.flowers.map{|fl| stringify(fl, @flowers_spec)}.join
    "#{name}#{size}#{f}#{total}"
  end

  private

  def stringify(f, f_spec)
    f_spec.each do |fs|
      if fs.specie == f.specie
        f = "#{fs.qty}#{f.specie}"
      end
    end
    f
  end
end
