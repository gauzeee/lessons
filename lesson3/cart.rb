items = {}

loop do
  puts "Введите название товара"
  item = gets.chomp
break if item == "стоп"
  puts "Введите цену за единицу товара"
  price = gets.chomp.to_f
  puts "Введите количество товара"
  num = gets.chomp.to_f
  items[item] = { cost: price, amount: num }
end
  puts items


sum = 0

items.each do |product, product_sum|
  sum_item = 0
  sum_item += product_sum[:cost] * product_sum[:amount]
  sum += sum_item
  puts "#{product}  общей стоимостью  #{sum_item}"
end

puts "Общая сумма покупок #{sum}"
