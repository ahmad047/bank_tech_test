require 'bank_account'

describe BankAccount do
  let(:bank_account) { described_class.new }

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
      expect(bank_account.transactions.first.date).to eq Time.now.strftime('%d/%m/%Y')
      expect(bank_account.transactions.first.credit).to eq 500
      expect(bank_account.transactions.first.debit).to eq ''
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
      expect(bank_account.transactions.last.date).to eq Time.now.strftime('%d/%m/%Y')
      expect(bank_account.transactions.last.credit).to eq ''
      expect(bank_account.transactions.last.debit).to eq 100
      expect(bank_account.transactions.last.balance).to eq 400
    end
  end
end
