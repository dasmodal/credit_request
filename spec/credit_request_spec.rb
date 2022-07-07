require 'credit_request'

describe CreditRequest do
  it 'check instance variable' do
    credit_request = CreditRequest.new(age: 20, salary: 30_000, gender: :male,
      credit_history: false, request_amount: 50_000)
    expect(credit_request.age).to eq 20
    expect(credit_request.salary).to eq 30_000
    expect(credit_request.gender).to eq :male
    expect(credit_request.credit_history).to eq false
    expect(credit_request.request_amount).to eq 50_000
  end

  describe '#calculate_score!' do
    it 'get score with 10' do
      credit_request = CreditRequest.new(age: 20, salary: 30_000, gender: :male,
        credit_history: false, request_amount: 50_000)
      expect(credit_request.score).to eq 10
    end

    it 'get score with 60' do
      credit_request = CreditRequest.new(age: 25, salary: 60_000, gender: :woman,
        credit_history: false, request_amount: 10_000)
      expect(credit_request.score).to eq 60
    end

    it 'get score with 80' do
      credit_request = CreditRequest.new(age: 45, salary: 25_000, gender: :woman,
        credit_history: true, request_amount: 5_000)
      expect(credit_request.score).to eq 80
    end
  end

  describe '#approved?' do
    it 'true for score 60' do
      credit_request = CreditRequest.new(age: 25, salary: 60_000, gender: :woman,
        credit_history: false, request_amount: 10_000)
      expect(credit_request.approved?).to eq true
    end

    it 'false for score 10' do
      credit_request = CreditRequest.new(age: 20, salary: 30_000, gender: :male,
        credit_history: false, request_amount: 50_000)
      expect(credit_request.approved?).to eq false
    end
  end
end
