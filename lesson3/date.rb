puts "Введите дату в формате ХХ.ХХ.ХХХХ год"
puts "Введите день"
day = gets.chomp.to_i
puts "Введите месяц"
month = gets.chomp.to_i
puts "Введите год"
year = gets.chomp.to_i

months = [31, 28, 31, 31, 30, 31, 30, 31, 30, 31, 30, 31]

if ( year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0
  months[1] = 29
end

months.each_with_index do |mont, index|
  if month - 1 > index
    day += mont
  end
end


puts "Вы выбрали #{day} день с начала года"
