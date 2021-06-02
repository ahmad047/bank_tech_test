class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    increase_balance(amount)
    transaction = {
      date: Time.now.strftime('%d/%m/%Y'),
      debit: 0,
      credit: amount,
      balance: @balance
    }
    @transactions << transaction
  end

  def withdraw(amount)
    decrease_balance(amount)
  end

  private

  def increase_balance(amount)
    @balance += amount
  end

  def decrease_balance(amount)
    @balance -= amount
  end
end
