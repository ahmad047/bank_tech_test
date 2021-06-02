require_relative 'transaction'

class BankAccount
  attr_reader :current_balance, :transactions

  def initialize
    @current_balance = 0
    @transactions = []
  end

  def deposit(amount)
    increase_balance(amount)
    transaction = Transaction.new(credit: amount, balance: @current_balance)
    @transactions << transaction
  end

  def withdraw(amount)
    decrease_balance(amount)
    transaction = Transaction.new(debit: amount, balance: @current_balance)
    @transactions << transaction
  end

  private

  def increase_balance(amount)
    @current_balance += amount
  end

  def decrease_balance(amount)
    @current_balance -= amount
  end
end
