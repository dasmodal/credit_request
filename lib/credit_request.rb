class CreditRequest
  attr_reader :age, :salary, :gender, :credit_history, :request_amount, :score

  def initialize(params)
    @age = params[:age]
    @salary = params[:salary]
    @gender = params[:gender]
    @credit_history = params[:credit_history]
    @request_amount = params[:request_amount]
    @score = calculate_scoring
  end

  def approved?
    @score >= 50
  end

  def calculate_scoring
    result = 0

    if @age.between?(21, 40)
      result += 10
    elsif @age > 40
      result += 20
    end

    result += 10 if @gender == :woman

    if @salary.between?(20_001, 40_000)
      result += 10
    elsif @salary > 40_000
      result += 20
    end

    result += 20 if @credit_history == true

    if @request_amount.between?(20_001, 40_000)
      result += 10
    elsif @request_amount < 20_000
      result += 20
    end

    result
  end
end
