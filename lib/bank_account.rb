require_relative 'transaction'

class BankAccount
  attr_reader :current_balance, :transactions

  def initialize
    @current_balance = 0
    @transactions = []
  end

  def deposit(amount)
    increase_balance(amount)
    @transactions << Transaction.new(credit: amount, balance: @current_balance)
  end

  def withdraw(amount)
    insufficient_funds?(amount) ? raise_error : decrease_balance(amount)
    @transactions << Transaction.new(debit: amount, balance: @current_balance)
  end

  private

  def increase_balance(amount)
    @current_balance += amount
  end

  def decrease_balance(amount)
    @current_balance -= amount
  end

  def insufficient_funds?(amount)
    @current_balance < amount
  end

  def raise_error
    raise "Not enough funds to withdraw. Available balance: #{@current_balance}"
  end
end
