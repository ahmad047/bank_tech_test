require 'transaction'

describe Transaction do
  let(:transaction) { described_class.new(credit: 50, balance: 50) }

  it 'has a date, debit, credit and balance associated with the transaction' do
    expect(transaction.date).to eq Time.now.strftime('%d/%m/%Y')
    expect(transaction.credit).to eq 50
    expect(transaction.debit).to eq ''
    expect(transaction.balance).to eq 50
  end
end
