require 'bank_account'

describe BankAccount do
  let(:bank_account) { described_class.new }

  it 'should start with a balance of zero' do
    expect(bank_account.balance).to eq 0
  end
end
