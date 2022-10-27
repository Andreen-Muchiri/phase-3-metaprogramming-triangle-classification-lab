class Triangle
  # write code here
  attr_accessor :base, :height, :hypotenuse
 
  def initialize(base,height,hypotenuse)
    @base = base
    @height = height
    @hypotenuse = hypotenuse

  end

  def kind
    validate_triangle
    if base == height && height == hypotenuse
     :equilateral

    elsif base == hypotenuse || height == base || hypotenuse == height
      :isosceles
   
      else
       :scalene
      end
  end

  def sides_greater_than_zero?
    [base,height,hypotenuse].all?(&:positive?)
   
  end

  def validate_triangle_inequality?
     base + height > hypotenuse && height + hypotenuse > base && hypotenuse + base > height
 end

 def validate_triangle
  raise TriangleError unless  sides_greater_than_zero? && validate_triangle_inequality?
 end

class TriangleError < StandardError
end

end
