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
      expect(bank_account.transactions[0][:balance]).to eq 500
      expect(bank_account.transactions[0][:credit]).to eq 500
      expect(bank_account.transactions[0][:debit]).to eq 0
      expect(bank_account.transactions[0][:date]).to eq Time.now.strftime('%d/%m/%Y')
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
      expect(bank_account.transactions[1][:balance]).to eq 400
      expect(bank_account.transactions[0][:credit]).to eq 500
      expect(bank_account.transactions[1][:debit]).to eq 100
      expect(bank_account.transactions[1][:date]).to eq Time.now.strftime('%d/%m/%Y')
    end
  end
end
