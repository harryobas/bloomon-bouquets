require "bloomon/bouquets/flower_specification"
require "bloomon/bouquets/util"

class Bloomon::Bouquets::BouquetSpecParser
  class << self
    def parse_spec(spec_string)
      spec_attr = {}
      spec_attr[:name] = spec_string[0]
      spec_attr[:size] = spec_string[1]

      attrs = spec_string.scan /[0-9a-z]/

      if attrs[-1].is_number? && attrs[-2].is_number?
        spec_attr[:total] = ("#{attrs.pop}" "#{attrs.pop}").reverse
      end

      if attrs[-1].is_number? && !attrs[-2].is_number?
        spec_attr[:total] = "#{attrs.pop}"
      end

      attrs = attrs.map do |a|
        normalize(a, attrs)
      end

      attrs.each do |a|
        if a.is_number? and attrs[(attrs.index(a)) + 1].is_number?
          attrs.delete_at (attrs.index(a)) + 1
        end
      end

      attrs = attrs.each_slice(2).map(&:join)
      f = []

      attrs.each do |a|
        if a.length > 2
          a = a.scan(/..?/)
        end
        if a[1].length == 2
          a[1] = a[1][1]
        end
        f << Bloomon::Bouquets::FlowerSpecification.new(a[0], a[1])
      rescue StandardError => e
        raise StandardError.new "something went wrong"
      end
      spec_attr[:flowers] = f
      spec_attr
    end

    private

    def normalize(a, attrs)
      if a.is_number? and attrs[(attrs.index(a)) + 1].is_number?
        a = "#{a}#{attrs[(attrs.index(a)) + 1]}"
      end
      a
    end
  end
end
