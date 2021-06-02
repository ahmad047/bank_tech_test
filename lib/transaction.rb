class Transaction
  attr_reader :date, :debit, :credit, :balance

  def initialize(args)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = args[:credit] || 0
    @debit = args[:debit] || 0
    @balance = args[:balance]
  end
end
