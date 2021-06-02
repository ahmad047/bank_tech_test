require 'bank_account'

describe BankAccount do
  let(:bank_account) { described_class.new }

  it 'should start with a balance of zero' do
    expect(bank_account.balance).to eq 0
  end

  it 'should start with no transactions' do
    expect(bank_account.transactions).to eq []
  end

  describe '#deposit' do
    it 'should update the balance when i deposit money' do
      bank_account.deposit(500)
      expect(bank_account.balance).to eq 500
    end
  end
end
