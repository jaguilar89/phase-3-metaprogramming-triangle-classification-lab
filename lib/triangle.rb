class Triangle
  attr_accessor :length1, :length2, :length3

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def validate_triangle
    a = @length1
    b = @length2
    c = @length3

    raise TriangleError unless
      a > 0 && b > 0 && c > 0
    raise TriangleError unless
      a + b > c && b + c > a && a + c > b
    
      return true
  end

  def kind
    if validate_triangle
      case [@length1, @length2, @length3].uniq.length
      when 1 then :equilateral
      when 2 then :isosceles
      else :scalene
      end
    end
  end

  class TriangleError < StandardError
    def message
      "Triangle is not valid!"
    end
  end
end
