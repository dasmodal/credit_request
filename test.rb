require_relative 'lib/credit_request'
# 20  | 30_000 |  m     |  n             | 50_000         | 10
# 25  | 60_000 |  w     |  n             | 10_000         | 60
# 45  | 25_000 |  w     |  y             | 5_000          | 80

cr1 = CreditRequest.new(20, 30_000, 'm', 'n', 50_000)
cr2 = CreditRequest.new(25, 60_000, 'w', 'n', 10_000)
cr3 = CreditRequest.new(45, 25_000, 'w', 'y', 5_000)

puts "#{cr1.calculate_scoring} (ожидаем 10)"
puts "#{cr2.calculate_scoring} (ожидаем 60)"
puts "#{cr3.calculate_scoring} (ожидаем 80)"
