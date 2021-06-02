class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(value)
    @balance += value
  end

  def withdraw(value)
    @balance -= value
  end
end
