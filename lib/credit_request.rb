class CreditRequest
	attr_reader :age, :salary, :gender, :credit_history, :request_amount

  def initialize(age, salary, gender, credit_history, request_amount)
    @age = age
    @salary = salary
    @gender = gender
    @credit_history = credit_history
    @request_amount = request_amount
    @scoring = calculate_scoring
  end

  def calculate_scoring
    result = 0

    if @age.between?(21, 40)
      result += 10
    elsif @age > 40
      result += 20
    end

    result += 10 if @gender == 'w'

    if @salary.between?(20_001, 40_000)
      result += 10
    elsif @salary > 40_000
      result += 20
    end

    result += 20 if @credit_history == 'y'

    if @request_amount.between?(20_001, 40_000)
      result += 10
    elsif @request_amount < 20_000
      result += 20
    end

    result
  end

  def approve?
    @scoring >= 50
  end
end
