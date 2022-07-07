require_relative 'lib/credit_request'

puts 'Добро пожаловать! Кредитная организация рада вашему запросу!'
puts

puts 'Сколько вам полных лет?'
age = $stdin.gets.to_i

puts 'Какая у вас месячная зарплата (в рублях)?'
salary = $stdin.gets.to_i

puts 'Какой ваш пол (m/w):'
gender = :female if $stdin.gets[0] == 'w'

puts 'Есть ли у вас кредитная история? (y/n)'
credit_history = true if $stdin.gets[0] == 'y'

puts 'Сколько денег вы хотите взять?'
request_amount = $stdin.gets.to_i

credit_request = CreditRequest.new(
  age: age,
  salary: salary,
  gender: gender,
  credit_history: credit_history,
  request_amount: request_amount
)

if credit_request.approved?
  puts 'Ваш кредит одобрен!'
else
  puts 'Извините, вам отказано. Попробуйте обратиться позже.'
end
