require 'bank_account'

describe BankAccount do
  let(:bank_account) { described_class.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  it 'should start with a balance of zero' do
    expect(bank_account.current_balance).to eq 0
  end

  it 'should start with no transactions' do
    expect(bank_account.transactions).to eq []
  end

  describe '#deposit' do
    it 'should update the balance when i deposit funds' do
      bank_account.deposit(500)
      expect(bank_account.current_balance).to eq 500
    end

    it 'should save the transaction on deposit' do
      bank_account.deposit(500)
      expect(bank_account.transactions.first.date).to eq date
      expect(bank_account.transactions.first.credit).to eq 500
      expect(bank_account.transactions.first.debit).to eq 0
      expect(bank_account.transactions.first.balance).to eq 500
    end
  end

  describe '#withdraw' do
    it 'should update the balance when i withdraw funds' do
      bank_account.deposit(500)
      bank_account.withdraw(400)
      expect(bank_account.current_balance).to eq 100
    end

    it 'should save the transaction on withdraw' do
      bank_account.deposit(500)
      bank_account.withdraw(100)
      expect(bank_account.transactions.last.date).to eq date
      expect(bank_account.transactions.last.credit).to eq 0
      expect(bank_account.transactions.last.debit).to eq 100
      expect(bank_account.transactions.last.balance).to eq 400
    end

    it 'raises an error for not enough funds' do
      bank_account.deposit(5)
      expect { bank_account.withdraw(10) }.to raise_error('Not enough funds to withdraw. Available balance: 5')
    end
  end

  describe '#print_statement' do
    it 'should print the statement' do
      bank_account.deposit(1000)
      statement = "date || credit || debit || balance\n#{date} || 1000.00 || || 1000.00"
      bank_account.print_statement
    end
  end
end
