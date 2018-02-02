puts "Введите дату в формате ХХ.ХХ.ХХХХ год"
puts "Введите день"
day = gets.chomp.to_i
puts "Введите месяц"
month = gets.chomp.to_i
puts "Введите год"
year = gets.chomp.to_i

months = [31, 28, 31, 31, 30, 31, 30, 31, 30, 31, 30, 31]

months[1] = 29 if ( year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0

mont_sum = 0
i = 0
while i < month - 1
  mont = months[i]
  mont_sum += mont
  i += 1
end

day += mont_sum


puts "Вы выбрали #{day} день с начала года"
