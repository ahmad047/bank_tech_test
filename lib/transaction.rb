class Transaction
  attr_reader :date, :debit, :credit, :balance

  def initialize(args)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = args[:credit] || ''
    @debit = args[:debit] || ''
    @balance = args[:balance]
  end
end
