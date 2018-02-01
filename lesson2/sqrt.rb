puts "Имеем квадратное уравнение вида: ax^2 + bx + c = 0. Введите A."
a = gets.to_f
puts "Введите В"
b = gets.to_f
puts "Введите С"
c = gets.to_f

D = b**2 - 4 * a * c
puts "D (дискриминант) = #{D}"

if D < 0
  puts "Уравнение не имеет корней"
elsif D > 0
  disc = Math.sqrt(D)
  x1 = ( - b + disc) / (2 * a)
  x2 = ( - b - disc) / (2 * a)
  puts "X1 = #{x1}; X2 = #{x2};"
else
  x = ( - b) / (2 * a)
  puts "X = #{x};"
end
